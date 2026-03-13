# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      class Client
        # @param client [Candid::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # @param request_options [Hash]
        # @param params [Candid::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/non-insurance-payers/v1",
            body: Candid::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerId] :non_insurance_payer_id
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def toggle_enablement(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}/toggle_enablement",
            body: Candid::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :name
        # @option params [String, nil] :category
        # @option params [String, nil] :categories_exact
        # @option params [String, nil] :clinical_trial_ids
        # @option params [Boolean, nil] :enabled
        # @option params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :page_token
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[name category categories_exact clinical_trial_ids enabled sort sort_direction limit page_token]
          query_params = {}
          query_params["name"] = params[:name] if params.key?(:name)
          query_params["category"] = params[:category] if params.key?(:category)
          query_params["categories_exact"] = params[:categories_exact] if params.key?(:categories_exact)
          query_params["clinical_trial_ids"] = params[:clinical_trial_ids] if params.key?(:clinical_trial_ids)
          query_params["enabled"] = params[:enabled] if params.key?(:enabled)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/non-insurance-payers/v1",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns a paginated list of all non-insurance payer categories.
        #
        # Non-insurance payer categories are simply strings and are not stored as a
        # separate object in Candid. They are created when added to at least one
        # non-insurance payer's `category` field and are deleted when there are no
        # longer any non-insurance payers that contain them.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :search_term
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :page_token
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage]
        def get_categories(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[search_term limit page_token]
          query_params = {}
          query_params["search_term"] = params[:search_term] if params.key?(:search_term)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/non-insurance-payers/v1/categories",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerId] :non_insurance_payer_id
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerId] :non_insurance_payer_id
        #
        # @return [Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}",
            body: Candid::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayer.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayers::V1::Types::NonInsurancePayerId] :non_insurance_payer_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/non-insurance-payers/v1/#{params[:non_insurance_payer_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
