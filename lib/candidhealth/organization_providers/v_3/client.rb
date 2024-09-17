# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/organization_provider_v_2"
require_relative "../v_2/types/organization_provider_sort_options"
require_relative "types/organization_provider_page_v_2"
require_relative "types/organization_provider_create_v_2"
require_relative "types/organization_provider_update_v_2"
require "async"

module CandidApiClient
  module OrganizationProviders
    module V3
      class V3Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::OrganizationProviders::V3::V3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param organization_provider_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.get(organization_provider_id: "965A563A-0285-4910-9569-E3739C0F6EAB")
        def get(organization_provider_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-providers/v3/#{organization_provider_id}"
          end
          CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param search_term [String] Filter to a name or a part of a name.
        # @param npi [String] Filter to a specific NPI.
        # @param is_rendering [Boolean] Filter to only rendering providers.
        # @param is_billing [Boolean] Filter to only billing providers.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param sort [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderSortOptions] Defaults to PROVIDER_NAME_ASC.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderPageV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.get_multi(
        #    limit: 100,
        #    search_term: "john",
        #    npi: "1234567890",
        #    is_rendering: true,
        #    is_billing: true,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    sort: PROVIDER_NAME_ASC
        #  )
        def get_multi(limit: nil, search_term: nil, npi: nil, is_rendering: nil, is_billing: nil, page_token: nil,
                      sort: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-providers/v3"
          end
          CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderPageV2.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderCreateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (CandidApiClient::OrganizationProviders::V2::Types::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (CandidApiClient::OrganizationProviders::V2::Types::LicenseType)
        #   * :addresses (Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>)
        #   * :employment_start_date (Date)
        #   * :employment_termination_date (Date)
        #   * :qualifications (Array<CandidApiClient::Identifiers::Types::IdentifierCreate>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.create(request: { npi: "string", is_rendering: true, is_billing: true, first_name: "string", last_name: "string", organization_name: "string", provider_type: INDIVIDUAL, tax_id: "string", taxonomy_code: "string", license_type: MD, addresses: [{ address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, address_type: DEFAULT }], employment_start_date: DateTime.parse(2023-01-15), employment_termination_date: DateTime.parse(2023-01-15), qualifications: [{ period: { start_date: "string", end_date: {"key":"value"} }, identifier_code: MCR }] })
        def create(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-providers/v3"
          end
          CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
        end

        # @param organization_provider_id [String]
        # @param request [Hash] Request of type CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (CandidApiClient::OrganizationProviders::V2::Types::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (CandidApiClient::OrganizationProviders::V2::Types::LicenseType)
        #   * :addresses (Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>)
        #   * :employment_start_date (String)
        #   * :employment_termination_date (String)
        #   * :qualifications (Array<CandidApiClient::Identifiers::Types::UpdatableIdentifier>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.update(organization_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", is_rendering: true, is_billing: true, first_name: "string", last_name: "string", organization_name: "string", provider_type: INDIVIDUAL, tax_id: "string", taxonomy_code: "string", license_type: MD, addresses: [{ address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, address_type: DEFAULT }], employment_start_date: "string", employment_termination_date: "string", qualifications:  })
        def update(organization_provider_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-providers/v3/#{organization_provider_id}"
          end
          CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::OrganizationProviders::V3::AsyncV3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param organization_provider_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.get(organization_provider_id: "965A563A-0285-4910-9569-E3739C0F6EAB")
        def get(organization_provider_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-providers/v3/#{organization_provider_id}"
            end
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param search_term [String] Filter to a name or a part of a name.
        # @param npi [String] Filter to a specific NPI.
        # @param is_rendering [Boolean] Filter to only rendering providers.
        # @param is_billing [Boolean] Filter to only billing providers.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param sort [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderSortOptions] Defaults to PROVIDER_NAME_ASC.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderPageV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.get_multi(
        #    limit: 100,
        #    search_term: "john",
        #    npi: "1234567890",
        #    is_rendering: true,
        #    is_billing: true,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    sort: PROVIDER_NAME_ASC
        #  )
        def get_multi(limit: nil, search_term: nil, npi: nil, is_rendering: nil, is_billing: nil, page_token: nil,
                      sort: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-providers/v3"
            end
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderPageV2.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderCreateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (CandidApiClient::OrganizationProviders::V2::Types::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (CandidApiClient::OrganizationProviders::V2::Types::LicenseType)
        #   * :addresses (Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>)
        #   * :employment_start_date (Date)
        #   * :employment_termination_date (Date)
        #   * :qualifications (Array<CandidApiClient::Identifiers::Types::IdentifierCreate>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.create(request: { npi: "string", is_rendering: true, is_billing: true, first_name: "string", last_name: "string", organization_name: "string", provider_type: INDIVIDUAL, tax_id: "string", taxonomy_code: "string", license_type: MD, addresses: [{ address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, address_type: DEFAULT }], employment_start_date: DateTime.parse(2023-01-15), employment_termination_date: DateTime.parse(2023-01-15), qualifications: [{ period: { start_date: "string", end_date: {"key":"value"} }, identifier_code: MCR }] })
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-providers/v3"
            end
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end

        # @param organization_provider_id [String]
        # @param request [Hash] Request of type CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2, as a Hash
        #   * :npi (String)
        #   * :is_rendering (Boolean)
        #   * :is_billing (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        #   * :provider_type (CandidApiClient::OrganizationProviders::V2::Types::ProviderType)
        #   * :tax_id (String)
        #   * :taxonomy_code (String)
        #   * :license_type (CandidApiClient::OrganizationProviders::V2::Types::LicenseType)
        #   * :addresses (Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>)
        #   * :employment_start_date (String)
        #   * :employment_termination_date (String)
        #   * :qualifications (Array<CandidApiClient::Identifiers::Types::UpdatableIdentifier>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_providers.v_3.update(organization_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", is_rendering: true, is_billing: true, first_name: "string", last_name: "string", organization_name: "string", provider_type: INDIVIDUAL, tax_id: "string", taxonomy_code: "string", license_type: MD, addresses: [{ address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, address_type: DEFAULT }], employment_start_date: "string", employment_termination_date: "string", qualifications:  })
        def update(organization_provider_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-providers/v3/#{organization_provider_id}"
            end
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
