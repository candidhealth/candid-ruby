# frozen_string_literal: true

require_relative "../../../commons/types/street_address_long_zip"
require_relative "address_type"
require "json"

module CandidApiClient
  module OrganizationProviders
    module V2
      class OrganizationProviderAddress
        attr_reader :address, :address_type, :additional_properties

        # @param address [Commons::StreetAddressLongZip] The address of the provider
        # @param address_type [OrganizationProviders::V2::AddressType] The address type of the provider
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [OrganizationProviders::V2::OrganizationProviderAddress]
        def initialize(address:, address_type:, additional_properties: nil)
          # @type [Commons::StreetAddressLongZip] The address of the provider
          @address = address
          # @type [OrganizationProviders::V2::AddressType] The address type of the provider
          @address_type = address_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of OrganizationProviderAddress
        #
        # @param json_object [JSON]
        # @return [OrganizationProviders::V2::OrganizationProviderAddress]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = Commons::StreetAddressLongZip.from_json(json_object: address)
          end
          address_type = struct.address_type
          new(address: address, address_type: address_type, additional_properties: struct)
        end

        # Serialize an instance of OrganizationProviderAddress to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "address": @address, "address_type": @address_type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          Commons::StreetAddressLongZip.validate_raw(obj: obj.address)
          obj.address_type.is_a?(OrganizationProviders::V2::AddressType) != false || raise("Passed value for field obj.address_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
