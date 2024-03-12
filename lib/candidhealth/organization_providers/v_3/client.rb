# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../v_2/types/organization_provider_id"
require_relative "types/organization_provider_v_2"
require_relative "../../commons/types/page_token"
require_relative "../v_2/types/organization_provider_sort_options"
require_relative "types/organization_provider_page_v_2"
require_relative "types/organization_provider_create_v_2"
require_relative "types/organization_provider_update_v_2"
require "async"

module CandidApiClient
  module OrganizationProviders
    module V3
      class V3Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [OrganizationProviders::V3::V3Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param organization_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def get(organization_provider_id:, request_options: nil)
          response = @request_client.conn.get("/api/organization-providers/v3/#{organization_provider_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param search_term [String] Filter to a name or a part of a name.
        # @param npi [String] Filter to a specific NPI.
        # @param is_rendering [Boolean] Filter to only rendering providers.
        # @param is_billing [Boolean] Filter to only billing providers.
        # @param page_token [Commons::PAGE_TOKEN] The page token to continue paging through a previous request.
        # @param sort [OrganizationProviders::V2::OrganizationProviderSortOptions] Defaults to PROVIDER_NAME_ASC.
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderPageV2]
        def get_multi(limit: nil, search_term: nil, npi: nil, is_rendering: nil, is_billing: nil, page_token: nil,
                      sort: nil, request_options: nil)
          response = @request_client.conn.get("/api/organization-providers/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "search_term": search_term,
              "npi": npi,
              "is_rendering": is_rendering,
              "is_billing": is_billing,
              "page_token": page_token,
              "sort": sort
            }.compact
          end
          OrganizationProviders::V3::OrganizationProviderPageV2.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type OrganizationProviders::V3::OrganizationProviderCreateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (OrganizationProviders::V2::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (OrganizationProviders::V2::LicenseType)
        #   * :addresses (Array<OrganizationProviders::V2::OrganizationProviderAddress>)
        #   * :employment_start_date (Date)
        #   * :employment_termination_date (Date)
        #   * :qualifications (Array<Identifiers::IdentifierCreate>)
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/organization-providers/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
        end

        # @param organization_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request [Hash] Request of type OrganizationProviders::V3::OrganizationProviderUpdateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (OrganizationProviders::V2::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (OrganizationProviders::V2::LicenseType)
        #   * :addresses (Array<OrganizationProviders::V2::OrganizationProviderAddress>)
        #   * :employment_start_date (Commons::DATE)
        #   * :employment_termination_date (Commons::DATE)
        #   * :qualifications (Array<Identifiers::UpdatableIdentifier>)
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def update(organization_provider_id:, request:, request_options: nil)
          response = @request_client.conn.patch("/api/organization-providers/v3/#{organization_provider_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [OrganizationProviders::V3::AsyncV3Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param organization_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def get(organization_provider_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/organization-providers/v3/#{organization_provider_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param search_term [String] Filter to a name or a part of a name.
        # @param npi [String] Filter to a specific NPI.
        # @param is_rendering [Boolean] Filter to only rendering providers.
        # @param is_billing [Boolean] Filter to only billing providers.
        # @param page_token [Commons::PAGE_TOKEN] The page token to continue paging through a previous request.
        # @param sort [OrganizationProviders::V2::OrganizationProviderSortOptions] Defaults to PROVIDER_NAME_ASC.
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderPageV2]
        def get_multi(limit: nil, search_term: nil, npi: nil, is_rendering: nil, is_billing: nil, page_token: nil,
                      sort: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/organization-providers/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "search_term": search_term,
                "npi": npi,
                "is_rendering": is_rendering,
                "is_billing": is_billing,
                "page_token": page_token,
                "sort": sort
              }.compact
            end
            OrganizationProviders::V3::OrganizationProviderPageV2.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type OrganizationProviders::V3::OrganizationProviderCreateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (OrganizationProviders::V2::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (OrganizationProviders::V2::LicenseType)
        #   * :addresses (Array<OrganizationProviders::V2::OrganizationProviderAddress>)
        #   * :employment_start_date (Date)
        #   * :employment_termination_date (Date)
        #   * :qualifications (Array<Identifiers::IdentifierCreate>)
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/organization-providers/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end

        # @param organization_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request [Hash] Request of type OrganizationProviders::V3::OrganizationProviderUpdateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (OrganizationProviders::V2::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (OrganizationProviders::V2::LicenseType)
        #   * :addresses (Array<OrganizationProviders::V2::OrganizationProviderAddress>)
        #   * :employment_start_date (Commons::DATE)
        #   * :employment_termination_date (Commons::DATE)
        #   * :qualifications (Array<Identifiers::UpdatableIdentifier>)
        # @param request_options [RequestOptions]
        # @return [OrganizationProviders::V3::OrganizationProviderV2]
        def update(organization_provider_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/organization-providers/v3/#{organization_provider_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
