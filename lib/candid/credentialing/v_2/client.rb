# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      class Client
        # @return [Candid::Credentialing::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def create_facility(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/provider-credentialing-span/v2/facility",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def get_facility(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage]
        def get_all_facilities(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit page_token payer_uuid contracting_provider_id service_facility_id]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/provider-credentialing-span/v2/facility",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @return [untyped]
        def delete_facility(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}"
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

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def update_facility(request_options: {}, **params)
          _path_param_names = ["facility_credentialing_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/provider-credentialing-span/v2/facility/#{params[:facility_credentialing_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/provider-credentialing-span/v2",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage]
        def get_all(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit page_token payer_uuid provider_id as_rendering_provider as_contracting_provider]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/provider-credentialing-span/v2",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "DELETE",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}"
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

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def update(request_options: {}, **params)
          _path_param_names = ["provider_credentialing_id"]

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/provider-credentialing-span/v2/#{params[:provider_credentialing_id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
