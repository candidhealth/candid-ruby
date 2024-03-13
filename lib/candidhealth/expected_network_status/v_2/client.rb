# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../organization_providers/v_2/types/organization_provider_id"
require_relative "types/expected_network_status_request_v_2"
require_relative "types/expected_network_status_response_v_2"
require_relative "types/compute_all_in_network_providers_request"
require_relative "types/compute_all_in_network_providers_response"
require "async"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [ExpectedNetworkStatus::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Computes the expected network status for a given rendering provider.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param rendering_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request [Hash] Request of type ExpectedNetworkStatus::V2::ExpectedNetworkStatusRequestV2, as a Hash
        #   * :service_type (ExpectedNetworkStatus::V2::ServiceType)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (Payers::V3::PAYER_String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (ExpectedNetworkStatus::V2::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID)
        #   * :organization_service_facility_id (OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID)
        #   * :date_of_service (Date)
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2]
        def compute_for_rendering_provider(rendering_provider_id:, request:, request_options: nil)
          response = @request_client.conn.post("/api/expected-network-status/v2/compute/#{rendering_provider_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2.from_json(json_object: response.body)
        end

        # Computes all the in network providers for a given set of inputs.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param request [Hash] Request of type ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersRequest, as a Hash
        #   * :service_type (ExpectedNetworkStatus::V2::ServiceType)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (Payers::V3::PAYER_String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (ExpectedNetworkStatus::V2::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID)
        #   * :organization_service_facility_id (OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID)
        #   * :date_of_service (Date)
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse]
        def compute_all_in_network_providers(request:, request_options: nil)
          response = @request_client.conn.post("/api/expected-network-status/v2/compute") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [ExpectedNetworkStatus::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Computes the expected network status for a given rendering provider.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param rendering_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param request [Hash] Request of type ExpectedNetworkStatus::V2::ExpectedNetworkStatusRequestV2, as a Hash
        #   * :service_type (ExpectedNetworkStatus::V2::ServiceType)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (Payers::V3::PAYER_String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (ExpectedNetworkStatus::V2::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID)
        #   * :organization_service_facility_id (OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID)
        #   * :date_of_service (Date)
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2]
        def compute_for_rendering_provider(rendering_provider_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/expected-network-status/v2/compute/#{rendering_provider_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2.from_json(json_object: response.body)
          end
        end

        # Computes all the in network providers for a given set of inputs.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param request [Hash] Request of type ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersRequest, as a Hash
        #   * :service_type (ExpectedNetworkStatus::V2::ServiceType)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (Payers::V3::PAYER_String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (ExpectedNetworkStatus::V2::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID)
        #   * :organization_service_facility_id (OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID)
        #   * :date_of_service (Date)
        # @param request_options [RequestOptions]
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse]
        def compute_all_in_network_providers(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/expected-network-status/v2/compute") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
