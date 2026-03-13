# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
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
        # @param params [Candid::Credentialing::V2::Types::FacilityCredentialingSpanCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def create_facility(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/provider-credentialing-span/v2/facility",
            body: Candid::Credentialing::V2::Types::FacilityCredentialingSpanCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(response.body)
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
        # @option params [Candid::Credentialing::V2::Types::FacilityCredentialingSpanId] :facility_credentialing_id
        #
        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def get_facility(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(response.body)
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
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :page_token
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :contracting_provider_id
        # @option params [String, nil] :service_facility_id
        #
        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage]
        def get_all_facilities(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit page_token payer_uuid contracting_provider_id service_facility_id]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["contracting_provider_id"] = params[:contracting_provider_id] if params.key?(:contracting_provider_id)
          query_params["service_facility_id"] = params[:service_facility_id] if params.key?(:service_facility_id)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/provider-credentialing-span/v2/facility",
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
            Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Credentialing::V2::Types::FacilityCredentialingSpanId] :facility_credentialing_id
        #
        # @return [untyped]
        def delete_facility(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}",
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

        # @param request_options [Hash]
        # @param params [Candid::Credentialing::V2::Types::FacilityCredentialingSpanUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Credentialing::V2::Types::FacilityCredentialingSpanId] :facility_credentialing_id
        #
        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def update_facility(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::Credentialing::V2::Types::FacilityCredentialingSpanUpdate.new(params).to_h
          non_body_param_names = ["facility_credentialing_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::Credentialing::V2::Types::ProviderCredentialingSpanCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/provider-credentialing-span/v2",
            body: Candid::Credentialing::V2::Types::ProviderCredentialingSpanCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(response.body)
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
        # @option params [Candid::Commons::Types::ProviderCredentialingSpanId] :provider_credentialing_id
        #
        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(response.body)
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
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :page_token
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :provider_id
        # @option params [Boolean, nil] :as_rendering_provider
        # @option params [Boolean, nil] :as_contracting_provider
        #
        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit page_token payer_uuid provider_id as_rendering_provider as_contracting_provider]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["provider_id"] = params[:provider_id] if params.key?(:provider_id)
          query_params["as_rendering_provider"] = params[:as_rendering_provider] if params.key?(:as_rendering_provider)
          query_params["as_contracting_provider"] = params[:as_contracting_provider] if params.key?(:as_contracting_provider)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/provider-credentialing-span/v2",
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
            Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ProviderCredentialingSpanId] :provider_credentialing_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}",
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

        # @param request_options [Hash]
        # @param params [Candid::Credentialing::V2::Types::ProviderCredentialingSpanUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::ProviderCredentialingSpanId] :provider_credentialing_id
        #
        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::Credentialing::V2::Types::ProviderCredentialingSpanUpdate.new(params).to_h
          non_body_param_names = ["provider_credentialing_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
