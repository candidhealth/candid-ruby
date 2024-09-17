# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/expected_network_status_request_v_2"
require_relative "types/expected_network_status_response_v_2"
require_relative "types/compute_all_in_network_providers_request"
require_relative "types/compute_all_in_network_providers_response"
require "async"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Computes the expected network status for a given rendering provider.
        #  This endpoint is not available to all customers. Reach out to the Candid sales
        #  team
        #  to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param rendering_provider_id [String]
        # @param request [Hash] Request of type CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusRequestV2, as a Hash
        #   * :service_type (CandidApiClient::ExpectedNetworkStatus::V2::Types::ServiceType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (String)
        #   * :organization_service_facility_id (String)
        #   * :date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_2.compute_for_rendering_provider(rendering_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { service_type: NEW_PATIENT_VIDEO_APPT, place_of_service_code: PHARMACY, subscriber_information: { payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", member_id: "string", insurance_type: { line_of_business: MEDICARE } }, patient_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", date_of_service: DateTime.parse(2023-01-15) })
        def compute_for_rendering_provider(rendering_provider_id:, request:, request_options: nil)
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
                                               request_options: request_options)}/api/expected-network-status/v2/compute/#{rendering_provider_id}"
          end
          CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2.from_json(json_object: response.body)
        end

        # Computes all the in network providers for a given set of inputs.
        #  This endpoint is not available to all customers. Reach out to the Candid sales
        #  team
        #  to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param request [Hash] Request of type CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersRequest, as a Hash
        #   * :service_type (CandidApiClient::ExpectedNetworkStatus::V2::Types::ServiceType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (String)
        #   * :organization_service_facility_id (String)
        #   * :date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_2.compute_all_in_network_providers(request: { service_type: NEW_PATIENT_VIDEO_APPT, place_of_service_code: PHARMACY, subscriber_information: { payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", member_id: "string", insurance_type: { line_of_business: MEDICARE } }, patient_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", date_of_service: DateTime.parse(2023-01-15) })
        def compute_all_in_network_providers(request:, request_options: nil)
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
                                               request_options: request_options)}/api/expected-network-status/v2/compute"
          end
          CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Computes the expected network status for a given rendering provider.
        #  This endpoint is not available to all customers. Reach out to the Candid sales
        #  team
        #  to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param rendering_provider_id [String]
        # @param request [Hash] Request of type CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusRequestV2, as a Hash
        #   * :service_type (CandidApiClient::ExpectedNetworkStatus::V2::Types::ServiceType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (String)
        #   * :organization_service_facility_id (String)
        #   * :date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_2.compute_for_rendering_provider(rendering_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { service_type: NEW_PATIENT_VIDEO_APPT, place_of_service_code: PHARMACY, subscriber_information: { payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", member_id: "string", insurance_type: { line_of_business: MEDICARE } }, patient_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", date_of_service: DateTime.parse(2023-01-15) })
        def compute_for_rendering_provider(rendering_provider_id:, request:, request_options: nil)
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
                                                 request_options: request_options)}/api/expected-network-status/v2/compute/#{rendering_provider_id}"
            end
            CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2.from_json(json_object: response.body)
          end
        end

        # Computes all the in network providers for a given set of inputs.
        #  This endpoint is not available to all customers. Reach out to the Candid sales
        #  team
        #  to discuss enabling this endpoint if it is not available for your organization.
        #
        # @param request [Hash] Request of type CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersRequest, as a Hash
        #   * :service_type (CandidApiClient::ExpectedNetworkStatus::V2::Types::ServiceType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :subscriber_information (Hash)
        #     * :payer_uuid (String)
        #     * :member_id (String)
        #     * :insurance_type (Hash)
        #       * :line_of_business (CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness)
        #       * :insurance_type_codes (Hash)
        #   * :patient_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :billing_provider_id (String)
        #   * :organization_service_facility_id (String)
        #   * :date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.expected_network_status.v_2.compute_all_in_network_providers(request: { service_type: NEW_PATIENT_VIDEO_APPT, place_of_service_code: PHARMACY, subscriber_information: { payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", member_id: "string", insurance_type: { line_of_business: MEDICARE } }, patient_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", organization_service_facility_id: "30F55EE6-8C0E-43FC-A7FC-DAC00D5BF569", date_of_service: DateTime.parse(2023-01-15) })
        def compute_all_in_network_providers(request:, request_options: nil)
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
                                                 request_options: request_options)}/api/expected-network-status/v2/compute"
            end
            CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
