# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      class Client
        # @return [Candid::NonInsurancePayers::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/non-insurance-payers/v1",
            body: Candid::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def toggle_enablement(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}/toggle_enablement",
            body: Candid::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[name category categories_exact clinical_trial_ids enabled sort sort_direction limit
                                  page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payers/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns a paginated list of all non-insurance payer categories.
        #
        # Non-insurance payer categories are simply strings and are not stored as a
        # separate object in Candid. They are created when added to at least one
        # non-insurance payer's `category` field and are deleted when there are no
        # longer any non-insurance payers that contain them.
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage]
        def get_categories(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[search_term limit page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payers/v1/categories",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}",
            body: Candid::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}"
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
