# frozen_string_literal: true

module Candid
  module InsurancePayments
    module V1
      class Client
        # @return [Candid::InsurancePayments::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @return [Candid::InsurancePayments::V1::Types::InsurancePaymentsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit payer_uuid claim_id service_line_id billing_provider_id sort sort_direction
                                  page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/insurance-payments/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsurancePayments::V1::Types::InsurancePaymentsPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        # If the payment does not exist, a `403` will be thrown.
        #
        # @return [Candid::InsurancePayments::V1::Types::InsurancePayment]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/insurance-payments/v1/#{params[:insurance_payment_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsurancePayments::V1::Types::InsurancePayment.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
