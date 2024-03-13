# frozen_string_literal: true

require_relative "provider_id"
require_relative "../../../commons/types/street_address_long_zip"
require "json"

module CandidApiClient
  module EncounterProviders
    module V2
      class EncounterProvider
        attr_reader :provider_id, :address, :tax_id, :npi, :taxonomy_code, :first_name, :last_name, :organization_name,
                    :additional_properties

        # @param provider_id [EncounterProviders::V2::PROVIDER_ID]
        # @param address [Commons::StreetAddressLongZip]
        # @param tax_id [String]
        # @param npi [String]
        # @param taxonomy_code [String]
        # @param first_name [String] If the provider is an individual, this should be set instead of organization name
        # @param last_name [String] If the provider is an individual, this should be set instead of organization name
        # @param organization_name [String] If the provider is an organization, this should be set instead of first + last name
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [EncounterProviders::V2::EncounterProvider]
        def initialize(provider_id:, address:, npi:, tax_id: nil, taxonomy_code: nil, first_name: nil, last_name: nil,
                       organization_name: nil, additional_properties: nil)
          # @type [EncounterProviders::V2::PROVIDER_ID]
          @provider_id = provider_id
          # @type [Commons::StreetAddressLongZip]
          @address = address
          # @type [String]
          @tax_id = tax_id
          # @type [String]
          @npi = npi
          # @type [String]
          @taxonomy_code = taxonomy_code
          # @type [String] If the provider is an individual, this should be set instead of organization name
          @first_name = first_name
          # @type [String] If the provider is an individual, this should be set instead of organization name
          @last_name = last_name
          # @type [String] If the provider is an organization, this should be set instead of first + last name
          @organization_name = organization_name
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of EncounterProvider
        #
        # @param json_object [JSON]
        # @return [EncounterProviders::V2::EncounterProvider]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          provider_id = struct.provider_id
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = Commons::StreetAddressLongZip.from_json(json_object: address)
          end
          tax_id = struct.tax_id
          npi = struct.npi
          taxonomy_code = struct.taxonomy_code
          first_name = struct.first_name
          last_name = struct.last_name
          organization_name = struct.organization_name
          new(provider_id: provider_id, address: address, tax_id: tax_id, npi: npi, taxonomy_code: taxonomy_code,
              first_name: first_name, last_name: last_name, organization_name: organization_name, additional_properties: struct)
        end

        # Serialize an instance of EncounterProvider to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "provider_id": @provider_id,
            "address": @address,
            "tax_id": @tax_id,
            "npi": @npi,
            "taxonomy_code": @taxonomy_code,
            "first_name": @first_name,
            "last_name": @last_name,
            "organization_name": @organization_name
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.provider_id.is_a?(String) != false || raise("Passed value for field obj.provider_id is not the expected type, validation failed.")
          Commons::StreetAddressLongZip.validate_raw(obj: obj.address)
          obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
          obj.npi.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
          obj.taxonomy_code&.is_a?(String) != false || raise("Passed value for field obj.taxonomy_code is not the expected type, validation failed.")
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
