# frozen_string_literal: true

require_relative "../../requests"
require_relative "../commons/types/street_address_long_zip"
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
    # @param organization_name [String]
    # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
    #  not under the billing provider's NPI.
    #  Box 32 section (a) of the CMS-1500 claim form.
    # @param address [Hash] zip_plus_four_code is required for service facility address. When the
    #  zip_plus_four_code is not available use "9998" as per CMS documentation.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
    #   * :zip_plus_four_code (String)
    #   * :address_1 (String)
    #   * :address_2 (String)
    #   * :city (String)
    #   * :state (CandidApiClient::Commons::Types::State)
    #   * :zip_code (String)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.service_facility.update(
    #    service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
    #    organization_name: "string",
    #    npi: "string",
    #    address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }
    #  )
    def update(service_facility_id:, organization_name: nil, npi: nil, address: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          organization_name: organization_name,
          npi: npi,
          address: address
        }.compact
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
    # @param organization_name [String]
    # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
    #  not under the billing provider's NPI.
    #  Box 32 section (a) of the CMS-1500 claim form.
    # @param address [Hash] zip_plus_four_code is required for service facility address. When the
    #  zip_plus_four_code is not available use "9998" as per CMS documentation.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
    #   * :zip_plus_four_code (String)
    #   * :address_1 (String)
    #   * :address_2 (String)
    #   * :city (String)
    #   * :state (CandidApiClient::Commons::Types::State)
    #   * :zip_code (String)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.service_facility.update(
    #    service_facility_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
    #    organization_name: "string",
    #    npi: "string",
    #    address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }
    #  )
    def update(service_facility_id:, organization_name: nil, npi: nil, address: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            organization_name: organization_name,
            npi: npi,
            address: address
          }.compact
          req.url "#{@request_client.get_url(environment: CandidApi,
                                             request_options: request_options)}/api/service_facility/v2/#{service_facility_id}"
        end
        CandidApiClient::ServiceFacility::Types::EncounterServiceFacility.from_json(json_object: response.body)
      end
    end
  end
end
