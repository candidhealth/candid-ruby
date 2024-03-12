# frozen_string_literal: true

require_relative "../../commons/types/street_address_long_zip"
require "json"

module CandidApiClient
  class ServiceFacility
    # Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital.
    # For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home),
    # or the location where an in-person visit would have taken place, whichever is easier to identify.
    # If the provider is in-network, service facility may be defined in payer contracts.
    # Box 32 on the CMS-1500 claim form.
    # Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims
    # must match what was provided to the payer during the credentialing process.
    class EncounterServiceFacilityBase
      attr_reader :organization_name, :npi, :address, :additional_properties

      # @param organization_name [String]
      # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is not under the billing provider's NPI.
      #   Box 32 section (a) of the CMS-1500 claim form.
      # @param address [Commons::StreetAddressLongZip] zip_plus_four_code is required for service facility address. When the zip_plus_four_code is not available use "9998" as per CMS documentation.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [ServiceFacility::EncounterServiceFacilityBase]
      def initialize(organization_name:, address:, npi: nil, additional_properties: nil)
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

      # Deserialize a JSON object to an instance of EncounterServiceFacilityBase
      #
      # @param json_object [JSON]
      # @return [ServiceFacility::EncounterServiceFacilityBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        organization_name = struct.organization_name
        npi = struct.npi
        if parsed_json["address"].nil?
          address = nil
        else
          address = parsed_json["address"].to_json
          address = Commons::StreetAddressLongZip.from_json(json_object: address)
        end
        new(organization_name: organization_name, npi: npi, address: address, additional_properties: struct)
      end

      # Serialize an instance of EncounterServiceFacilityBase to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "organization_name": @organization_name, "npi": @npi, "address": @address }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.organization_name.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
        obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
        Commons::StreetAddressLongZip.validate_raw(obj: obj.address)
      end
    end
  end
end
