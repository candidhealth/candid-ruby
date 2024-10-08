# frozen_string_literal: true

require_relative "../../commons/types/street_address_long_zip"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceFacility
    module Types
      class EncounterServiceFacilityUpdate
        # @return [String]
        attr_reader :organization_name
        # @return [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
        #  not under the billing provider's NPI.
        #  Box 32 section (a) of the CMS-1500 claim form.
        attr_reader :npi
        # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] zip_plus_four_code is required for service facility address. When the
        #  zip_plus_four_code is not available use "9998" as per CMS documentation.
        attr_reader :address
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param organization_name [String]
        # @param npi [String] An NPI specific to the service facility if applicable, i.e. if it has one and is
        #  not under the billing provider's NPI.
        #  Box 32 section (a) of the CMS-1500 claim form.
        # @param address [CandidApiClient::Commons::Types::StreetAddressLongZip] zip_plus_four_code is required for service facility address. When the
        #  zip_plus_four_code is not available use "9998" as per CMS documentation.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate]
        def initialize(organization_name: OMIT, npi: OMIT, address: OMIT, additional_properties: nil)
          @organization_name = organization_name if organization_name != OMIT
          @npi = npi if npi != OMIT
          @address = address if address != OMIT
          @additional_properties = additional_properties
          @_field_set = { "organization_name": organization_name, "npi": npi, "address": address }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of EncounterServiceFacilityUpdate
        #
        # @param json_object [String]
        # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          organization_name = struct["organization_name"]
          npi = struct["npi"]
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: address)
          end
          new(
            organization_name: organization_name,
            npi: npi,
            address: address,
            additional_properties: struct
          )
        end

        # Serialize an instance of EncounterServiceFacilityUpdate to a JSON object
        #
        # @return [String]
        def to_json(*_args)
          @_field_set&.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given
        #  hash and check each fields type against the current object's property
        #  definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
          obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
          obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.address)
        end
      end
    end
  end
end
