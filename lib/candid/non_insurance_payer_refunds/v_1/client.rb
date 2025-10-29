# frozen_string_literal: true

module Candid
  module NonInsurancePayerRefunds
    module V1
      class Client
        # @return [Candid::NonInsurancePayerRefunds::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all non-insurance payer refunds satisfying the search criteria
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit non_insurance_payer_id check_number invoice_id sort sort_direction page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payer-refunds/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a previously created non-insurance payer refund by its `non_insurance_payer_refund_id`.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates a new non-insurance payer refund record and returns the newly created `NonInsurancePayerRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/non-insurance-payer-refunds/v1",
            body: Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates the non-insurance payer refund record matching the provided non_insurance_payer_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def update(request_options: {}, **params)
          _path_param_names = ["non_insurance_payer_refund_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes the non-insurance payer refund record matching the provided `non_insurance_payer_refund_id`.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
