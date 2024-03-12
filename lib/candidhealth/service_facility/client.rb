# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/service_facility_id"
require_relative "../commons/types/street_address_long_zip"
require_relative "types/encounter_service_facility"
require "async"

module CandidApiClient
  class ServiceFacilityClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [ServiceFacilityClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param service_facility_id [ServiceFacility::SERVICE_FACILITY_ID]
    # @param organization_name [String]
    # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
    #   Box 32 section (a) of the CMS-1500 claim form.
    # @param address [Hash] zip_plus_four_code is required for service facility address. When the zip_plus_four_code is not available use "9998" as per CMS documentation.Request of type Commons::StreetAddressLongZip, as a Hash
    #   * :zip_plus_four_code (String)
    #   * :address_1 (String)
    #   * :address_2 (String)
    #   * :city (String)
    #   * :state (Commons::State)
    #   * :zip_code (String)
    # @param request_options [RequestOptions]
    # @return [ServiceFacility::EncounterServiceFacility]
    def update(service_facility_id:, organization_name: nil, npi: nil, address: nil, request_options: nil)
      response = @request_client.conn.patch("/api/service_facility/v2/#{service_facility_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          organization_name: organization_name,
          npi: npi,
          address: address
        }.compact
      end
      ServiceFacility::EncounterServiceFacility.from_json(json_object: response.body)
    end
  end

  class AsyncServiceFacilityClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncServiceFacilityClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param service_facility_id [ServiceFacility::SERVICE_FACILITY_ID]
    # @param organization_name [String]
    # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
    #   Box 32 section (a) of the CMS-1500 claim form.
    # @param address [Hash] zip_plus_four_code is required for service facility address. When the zip_plus_four_code is not available use "9998" as per CMS documentation.Request of type Commons::StreetAddressLongZip, as a Hash
    #   * :zip_plus_four_code (String)
    #   * :address_1 (String)
    #   * :address_2 (String)
    #   * :city (String)
    #   * :state (Commons::State)
    #   * :zip_code (String)
    # @param request_options [RequestOptions]
    # @return [ServiceFacility::EncounterServiceFacility]
    def update(service_facility_id:, organization_name: nil, npi: nil, address: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch("/api/service_facility/v2/#{service_facility_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            organization_name: organization_name,
            npi: npi,
            address: address
          }.compact
        end
        ServiceFacility::EncounterServiceFacility.from_json(json_object: response.body)
      end
    end
  end
end
