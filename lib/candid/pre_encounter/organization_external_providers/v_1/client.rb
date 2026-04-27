# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
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

          # Gets an organization external provider by ID.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderId] :id
          #
          # @return [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider]
          def get(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/organization-external-providers/v1/#{params[:id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Searches for organization external providers that match the query parameters.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :page_token
          # @option params [String, nil] :sort_field
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          # @option params [String, nil] :npi
          # @option params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderType, nil] :type
          # @option params [String, nil] :first_name
          # @option params [String, nil] :last_name
          #
          # @return [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderPage]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[limit page_token sort_field sort_direction npi type first_name last_name]
            query_params = {}
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            query_params["npi"] = params[:npi] if params.key?(:npi)
            query_params["type"] = params[:type] if params.key?(:type)
            query_params["first_name"] = params[:first_name] if params.key?(:first_name)
            query_params["last_name"] = params[:last_name] if params.key?(:last_name)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/organization-external-providers/v1",
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
              Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Creates a new organization external provider. BadRequestError is returned when the NPI is already in use.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::MutableOrganizationExternalProvider]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider]
          def create(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/organization-external-providers/v1",
              body: Candid::PreEncounter::OrganizationExternalProviders::V1::Types::MutableOrganizationExternalProvider.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Updates an organization external provider. The path must contain the next version number to prevent race
          # conditions. For example, if the current version of the provider is n, you will need to send a request to
          # this endpoint with `/{id}/n+1` to update the provider. Updating historic versions is not supported.
          # BadRequestError is returned when the NPI is already in use by another provider.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::MutableOrganizationExternalProvider]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderId] :id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider]
          def update(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/organization-external-providers/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::OrganizationExternalProviders::V1::Types::MutableOrganizationExternalProvider.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Sets an organization external provider as deactivated. The path must contain the most recent version plus 1
          # to prevent race conditions. Deactivating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderId] :id
          # @option params [String] :version
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "DELETE",
              path: "/organization-external-providers/v1/#{params[:id]}/#{params[:version]}",
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

          # Scans up to 1000 organization external provider updates. The since query parameter is inclusive, and the
          # result list is ordered by updatedAt ascending.
          #
          # **Polling Pattern:**
          # To continuously poll for updates without gaps:
          # 1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
          # 2. The API returns 100 by default and up to 1000 records, sorted by `updated_at` ascending
          # 3. Find the `updated_at` value from the last record in the response
          # 4. Use that `updated_at` value as the `since` parameter in your next request
          # 5. Repeat steps 2-4 to ingest updates until you receive an empty list
          #
          # **Important Notes:**
          # - The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you
          # can deduplicate by ID and version)
          # - All records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for tracking
          # changes
          # - Timestamps have millisecond resolution for precise ordering
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :since
          # @option params [Integer, nil] :max_results
          #
          # @return [Array[Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[since max_results]
            query_params = {}
            query_params["since"] = params[:since] if params.key?(:since)
            query_params["maxResults"] = params[:max_results] if params.key?(:max_results)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/organization-external-providers/v1/updates/scan",
              query: query_params,
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
end
