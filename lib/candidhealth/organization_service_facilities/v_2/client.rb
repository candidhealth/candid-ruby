# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/organization_service_facility_id"
require_relative "types/organization_service_facility"
require_relative "../../commons/types/page_token"
require_relative "types/organization_service_facility_page"
require_relative "types/organization_service_facility_create"
require_relative "types/organization_service_facility_update"
require "async"

module CandidApiClient
  module OrganizationServiceFacilities
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [OrganizationServiceFacilities::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def get(organization_service_facility_id:, request_options: nil)
          response = @request_client.conn.get("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param name [String] Filter to a name or a part of a name.
        # @param page_token [Commons::PAGE_TOKEN] The page token to continue paging through a previous request.
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacilityPage]
        def get_multi(limit: nil, name: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get("/api/organization-service-facilities/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "name": name,
              "page_token": page_token
            }.compact
          end
          OrganizationServiceFacilities::V2::OrganizationServiceFacilityPage.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type OrganizationServiceFacilities::V2::OrganizationServiceFacilityCreate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :npi (String)
        #   * :status (OrganizationServiceFacilities::V2::ServiceFacilityStatus)
        #   * :operational_status (OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus)
        #   * :mode (OrganizationServiceFacilities::V2::ServiceFacilityMode)
        #   * :type (OrganizationServiceFacilities::V2::ServiceFacilityType)
        #   * :physical_type (OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def create(request:, request_options: nil)
          response = @request_client.conn.post("/api/organization-service-facilities/v2") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request [Hash] Request of type OrganizationServiceFacilities::V2::OrganizationServiceFacilityUpdate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :npi (String)
        #   * :status (OrganizationServiceFacilities::V2::ServiceFacilityStatus)
        #   * :operational_status (OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus)
        #   * :mode (OrganizationServiceFacilities::V2::ServiceFacilityMode)
        #   * :type (OrganizationServiceFacilities::V2::ServiceFacilityType)
        #   * :physical_type (OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def update(organization_service_facility_id:, request:, request_options: nil)
          response = @request_client.conn.patch("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(organization_service_facility_id:, request_options: nil)
          @request_client.conn.delete("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [OrganizationServiceFacilities::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def get(organization_service_facility_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Limit the number of results returned. Defaults to 100.
        # @param name [String] Filter to a name or a part of a name.
        # @param page_token [Commons::PAGE_TOKEN] The page token to continue paging through a previous request.
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacilityPage]
        def get_multi(limit: nil, name: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/organization-service-facilities/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "name": name,
                "page_token": page_token
              }.compact
            end
            OrganizationServiceFacilities::V2::OrganizationServiceFacilityPage.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type OrganizationServiceFacilities::V2::OrganizationServiceFacilityCreate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :npi (String)
        #   * :status (OrganizationServiceFacilities::V2::ServiceFacilityStatus)
        #   * :operational_status (OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus)
        #   * :mode (OrganizationServiceFacilities::V2::ServiceFacilityMode)
        #   * :type (OrganizationServiceFacilities::V2::ServiceFacilityType)
        #   * :physical_type (OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/organization-service-facilities/v2") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request [Hash] Request of type OrganizationServiceFacilities::V2::OrganizationServiceFacilityUpdate, as a Hash
        #   * :name (String)
        #   * :aliases (Array<String>)
        #   * :description (String)
        #   * :npi (String)
        #   * :status (OrganizationServiceFacilities::V2::ServiceFacilityStatus)
        #   * :operational_status (OrganizationServiceFacilities::V2::ServiceFacilityOperationalStatus)
        #   * :mode (OrganizationServiceFacilities::V2::ServiceFacilityMode)
        #   * :type (OrganizationServiceFacilities::V2::ServiceFacilityType)
        #   * :physical_type (OrganizationServiceFacilities::V2::ServiceFacilityPhysicalType)
        #   * :telecoms (Array<String>)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [OrganizationServiceFacilities::V2::OrganizationServiceFacility]
        def update(organization_service_facility_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            OrganizationServiceFacilities::V2::OrganizationServiceFacility.from_json(json_object: response.body)
          end
        end

        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(organization_service_facility_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/organization-service-facilities/v2/#{organization_service_facility_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
          end
        end
      end
    end
  end
end
