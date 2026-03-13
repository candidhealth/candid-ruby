# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
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
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::OrganizationProviders::V2::Types::OrganizationProviderId] :organization_provider_id
        #
        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/organization-providers/v3/#{params[:organization_provider_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(response.body)
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
        # @option params [String, nil] :search_term
        # @option params [String, nil] :npi
        # @option params [Boolean, nil] :is_rendering
        # @option params [Boolean, nil] :is_billing
        # @option params [String, nil] :organization_provider_ids
        # @option params [String, nil] :page_token
        # @option params [Candid::OrganizationProviders::V2::Types::OrganizationProviderSortOptions, nil] :sort
        #
        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderPageV2]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit search_term npi is_rendering is_billing organization_provider_ids page_token sort]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["search_term"] = params[:search_term] if params.key?(:search_term)
          query_params["npi"] = params[:npi] if params.key?(:npi)
          query_params["is_rendering"] = params[:is_rendering] if params.key?(:is_rendering)
          query_params["is_billing"] = params[:is_billing] if params.key?(:is_billing)
          query_params["organization_provider_ids"] = params[:organization_provider_ids] if params.key?(:organization_provider_ids)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/organization-providers/v3",
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
            Candid::OrganizationProviders::V3::Types::OrganizationProviderPageV2.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::OrganizationProviders::V3::Types::OrganizationProviderCreateV2]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/organization-providers/v3",
            body: Candid::OrganizationProviders::V3::Types::OrganizationProviderCreateV2.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Candid::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::OrganizationProviders::V2::Types::OrganizationProviderId] :organization_provider_id
        #
        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/organization-providers/v3/#{params[:organization_provider_id]}",
            body: Candid::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
