# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/organization_service_facility"
require_relative "../../commons/types/facility_type_code"
require_relative "types/organization_service_facility_page"
require_relative "types/organization_service_facility_create"
require_relative "types/organization_service_facility_update"
require "async"

module CandidApiClient
  module OrganizationServiceFacilities
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param organization_service_facility_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get(organization_service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(organization_service_facility_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
          end
          CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param name [String] Filter to a name or a part of a name.
        # @param organization_service_facility_ids [String] Filter to the provided organization service facility IDs.
        # @param external_ids [String] Filter by one or more external_ids.
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Filter by Place of Service (POS) code.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get_multi(
        #    limit: 100,
        #    name: "Test Service Facility",
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, name: nil, organization_service_facility_ids: nil, external_ids: nil,
                      place_of_service_code: nil, page_token: nil, request_options: nil)
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
              "name": name,
              "organization_service_facility_ids": organization_service_facility_ids,
              "external_ids": external_ids,
              "place_of_service_code": place_of_service_code,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-service-facilities/v2"
          end
          CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage.from_json(json_object: response.body)
        end

        # Looks up a single organization service facility by its `external_id` field. This
        #  can be useful
        #  for finding service facilities within Candid which are associated with service
        #  facilities in
        #  an external system.
        #
        # @param external_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get_by_external_id(external_id: "external_id")
        def get_by_external_id(external_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-service-facilities/v2/external-id/#{external_id}"
          end
          CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :external_id (String)
        #   * :npi (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus)
        #   * :operational_status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus)
        #   * :mode (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode)
        #   * :type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType)
        #   * :physical_type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.create(request: { name: "Test Service Facility", aliases: ["Test Service Facility Alias"], description: "Test Service Facility Description", status: ACTIVE, operational_status: CLOSED, mode: INSTANCE, type: DIAGNOSTICS_OR_THERAPEUTICS_UNIT, physical_type: SITE, telecoms: ["555-555-5555"], address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
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
                                               request_options: request_options)}/api/organization-service-facilities/v2"
          end
          CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param organization_service_facility_id [String]
        # @param request [Hash] Request of type CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityUpdate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :external_id (String)
        #   * :npi (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus)
        #   * :operational_status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus)
        #   * :mode (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode)
        #   * :type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType)
        #   * :physical_type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.update(organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", request: { name: "Test Service Facility", aliases: ["Test Service Facility Alias"], description: "Test Service Facility Description", status: ACTIVE, operational_status: CLOSED, mode: INSTANCE, type: DIAGNOSTICS_OR_THERAPEUTICS_UNIT, physical_type: SITE, telecoms: ["555-555-5555"], address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def update(organization_service_facility_id:, request:, request_options: nil)
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
                                               request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
          end
          CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param organization_service_facility_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.delete(organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569")
        def delete(organization_service_facility_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
          end
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param organization_service_facility_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get(organization_service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(organization_service_facility_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
            end
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param name [String] Filter to a name or a part of a name.
        # @param organization_service_facility_ids [String] Filter to the provided organization service facility IDs.
        # @param external_ids [String] Filter by one or more external_ids.
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Filter by Place of Service (POS) code.
        # @param page_token [String] The page token to continue paging through a previous request.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get_multi(
        #    limit: 100,
        #    name: "Test Service Facility",
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, name: nil, organization_service_facility_ids: nil, external_ids: nil,
                      place_of_service_code: nil, page_token: nil, request_options: nil)
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
                "name": name,
                "organization_service_facility_ids": organization_service_facility_ids,
                "external_ids": external_ids,
                "place_of_service_code": place_of_service_code,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-service-facilities/v2"
            end
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage.from_json(json_object: response.body)
          end
        end

        # Looks up a single organization service facility by its `external_id` field. This
        #  can be useful
        #  for finding service facilities within Candid which are associated with service
        #  facilities in
        #  an external system.
        #
        # @param external_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.get_by_external_id(external_id: "external_id")
        def get_by_external_id(external_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/organization-service-facilities/v2/external-id/#{external_id}"
            end
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :external_id (String)
        #   * :npi (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus)
        #   * :operational_status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus)
        #   * :mode (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode)
        #   * :type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType)
        #   * :physical_type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.create(request: { name: "Test Service Facility", aliases: ["Test Service Facility Alias"], description: "Test Service Facility Description", status: ACTIVE, operational_status: CLOSED, mode: INSTANCE, type: DIAGNOSTICS_OR_THERAPEUTICS_UNIT, physical_type: SITE, telecoms: ["555-555-5555"], address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
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
                                                 request_options: request_options)}/api/organization-service-facilities/v2"
            end
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param organization_service_facility_id [String]
        # @param request [Hash] Request of type CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityUpdate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :external_id (String)
        #   * :npi (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus)
        #   * :operational_status (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus)
        #   * :mode (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode)
        #   * :type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityType)
        #   * :physical_type (CandidApiClient::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.update(organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", request: { name: "Test Service Facility", aliases: ["Test Service Facility Alias"], description: "Test Service Facility Description", status: ACTIVE, operational_status: CLOSED, mode: INSTANCE, type: DIAGNOSTICS_OR_THERAPEUTICS_UNIT, physical_type: SITE, telecoms: ["555-555-5555"], address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def update(organization_service_facility_id:, request:, request_options: nil)
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
                                                 request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
            end
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param organization_service_facility_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.organization_service_facilities.v_2.delete(organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569")
        def delete(organization_service_facility_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/organization-service-facilities/v2/#{organization_service_facility_id}"
            end
          end
        end
      end
    end
  end
end
