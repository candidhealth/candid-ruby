# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      class Client
        # @return [Candid::InsuranceRefunds::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit payer_uuid claim_id service_line_id billing_provider_id sort sort_direction
                                  page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/insurance-refunds/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a previously created insurance refund by its `insurance_refund_id`.
        # If the refund does not exist, a `403` will be thrown.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/insurance-refunds/v1",
            body: Candid::InsuranceRefunds::V1::Types::InsuranceRefundCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def update(request_options: {}, **params)
          _path_param_names = ["insurance_refund_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes the insurance refund record matching the provided `insurance_refund_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}"
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
