# frozen_string_literal: true

require_relative "service_facility_id"
require_relative "../../commons/types/street_address_long_zip"
require "json"

module CandidApiClient
  class ServiceFacility
    class EncounterServiceFacility
      attr_reader :service_facility_id, :organization_name, :npi, :address, :additional_properties

      # @param service_facility_id [ServiceFacility::SERVICE_FACILITY_ID]
      # @param organization_name [String]
      # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
      #   Box 32 section (a) of the CMS-1500 claim form.
      # @param address [Commons::StreetAddressLongZip] zip_plus_four_code is required for service facility address. When the zip_plus_four_code is not available use "9998" as per CMS documentation.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [ServiceFacility::EncounterServiceFacility]
      def initialize(service_facility_id:, organization_name:, address:, npi: nil, additional_properties: nil)
        # @type [ServiceFacility::SERVICE_FACILITY_ID]
        @service_facility_id = service_facility_id
        # @type [String]
        @organization_name = organization_name
        # @type [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
        #   Box 32 section (a) of the CMS-1500 claim form.
        @npi = npi
        # @type [Commons::StreetAddressLongZip] zip_plus_four_code is required for service facility address. When the zip_plus_four_code is not available use "9998" as per CMS documentation.
        @address = address
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EncounterServiceFacility
      #
      # @param json_object [JSON]
      # @return [ServiceFacility::EncounterServiceFacility]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        service_facility_id = struct.service_facility_id
        organization_name = struct.organization_name
        npi = struct.npi
        if parsed_json["address"].nil?
          address = nil
        else
          address = parsed_json["address"].to_json
          address = Commons::StreetAddressLongZip.from_json(json_object: address)
        end
        new(service_facility_id: service_facility_id, organization_name: organization_name, npi: npi, address: address,
            additional_properties: struct)
      end

      # Serialize an instance of EncounterServiceFacility to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "service_facility_id": @service_facility_id,
          "organization_name": @organization_name,
          "npi": @npi,
          "address": @address
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.service_facility_id.is_a?(String) != false || raise("Passed value for field obj.service_facility_id is not the expected type, validation failed.")
        obj.organization_name.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
        obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
        Commons::StreetAddressLongZip.validate_raw(obj: obj.address)
      end
    end
  end
end
