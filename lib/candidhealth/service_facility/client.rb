# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/encounter_service_facility_update"
require_relative "types/encounter_service_facility"
require "async"

module CandidApiClient
  class ServiceFacilityClient
    # @return [CandidApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [CandidApiClient::RequestClient]
    # @return [CandidApiClient::ServiceFacilityClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param service_facility_id [String]
    # @param request [Hash] Request of type CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate, as a Hash
    #   * :organization_name (String)
    #   * :npi (String)
    #   * :address (Hash)
    #     * :zip_plus_four_code (String)
    #     * :address_1 (String)
    #     * :address_2 (String)
    #     * :city (String)
    #     * :state (CandidApiClient::Commons::Types::State)
    #     * :zip_code (String)
    #   * :secondary_identification (String)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.service_facility.update(service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { organization_name: "Test Organization", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
    def update(service_facility_id:, request:, request_options: nil)
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
                                           request_options: request_options)}/api/service_facility/v2/#{service_facility_id}"
      end
      CandidApiClient::ServiceFacility::Types::EncounterServiceFacility.from_json(json_object: response.body)
    end
  end

  class AsyncServiceFacilityClient
    # @return [CandidApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [CandidApiClient::AsyncRequestClient]
    # @return [CandidApiClient::AsyncServiceFacilityClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param service_facility_id [String]
    # @param request [Hash] Request of type CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate, as a Hash
    #   * :organization_name (String)
    #   * :npi (String)
    #   * :address (Hash)
    #     * :zip_plus_four_code (String)
    #     * :address_1 (String)
    #     * :address_2 (String)
    #     * :city (String)
    #     * :state (CandidApiClient::Commons::Types::State)
    #     * :zip_code (String)
    #   * :secondary_identification (String)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.service_facility.update(service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { organization_name: "Test Organization", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
    def update(service_facility_id:, request:, request_options: nil)
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
                                             request_options: request_options)}/api/service_facility/v2/#{service_facility_id}"
        end
        CandidApiClient::ServiceFacility::Types::EncounterServiceFacility.from_json(json_object: response.body)
      end
    end
  end
end
