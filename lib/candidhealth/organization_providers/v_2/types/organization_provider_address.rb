# frozen_string_literal: true

require_relative "../../../commons/types/street_address_long_zip"
require_relative "address_type"
require "ostruct"
require "json"

module CandidApiClient
  module OrganizationProviders
    module V2
      module Types
        class OrganizationProviderAddress
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] The address of the provider
          attr_reader :address
          # @return [CandidApiClient::OrganizationProviders::V2::Types::AddressType] The address type of the provider
          attr_reader :address_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param address [CandidApiClient::Commons::Types::StreetAddressLongZip] The address of the provider
          # @param address_type [CandidApiClient::OrganizationProviders::V2::Types::AddressType] The address type of the provider
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress]
          def initialize(address:, address_type:, additional_properties: nil)
            @address = address
            @address_type = address_type
            @additional_properties = additional_properties
            @_field_set = { "address": address, "address_type": address_type }
          end

          # Deserialize a JSON object to an instance of OrganizationProviderAddress
          #
          # @param json_object [String]
          # @return [CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: address)
            end
            address_type = struct["address_type"]
            new(
              address: address,
              address_type: address_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of OrganizationProviderAddress to a JSON object
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
            CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.address)
            obj.address_type.is_a?(CandidApiClient::OrganizationProviders::V2::Types::AddressType) != false || raise("Passed value for field obj.address_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
