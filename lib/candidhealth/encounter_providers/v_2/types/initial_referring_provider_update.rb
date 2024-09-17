# frozen_string_literal: true

require_relative "../../../commons/types/street_address_long_zip"
require_relative "../../../commons/types/qualifier_code"
require "ostruct"
require "json"

module CandidApiClient
  module EncounterProviders
    module V2
      module Types
        class InitialReferringProviderUpdate
          # @return [String] A National Provider Identifier is a unique 10-digit identification
          #  number issued to health care providers in the United States
          attr_reader :npi
          # @return [String]
          attr_reader :taxonomy_code
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip]
          attr_reader :address
          # @return [CandidApiClient::Commons::Types::QualifierCode]
          attr_reader :qualifier
          # @return [String] If the provider is an individual, this should be set instead of organization
          #  name
          attr_reader :first_name
          # @return [String] If the provider is an individual, this should be set instead of organization
          #  name
          attr_reader :last_name
          # @return [String] If the provider is an organization, this should be set instead of first + last
          #  name
          attr_reader :organization_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param npi [String] A National Provider Identifier is a unique 10-digit identification
          #  number issued to health care providers in the United States
          # @param taxonomy_code [String]
          # @param address [CandidApiClient::Commons::Types::StreetAddressLongZip]
          # @param qualifier [CandidApiClient::Commons::Types::QualifierCode]
          # @param first_name [String] If the provider is an individual, this should be set instead of organization
          #  name
          # @param last_name [String] If the provider is an individual, this should be set instead of organization
          #  name
          # @param organization_name [String] If the provider is an organization, this should be set instead of first + last
          #  name
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate]
          def initialize(npi: OMIT, taxonomy_code: OMIT, address: OMIT, qualifier: OMIT, first_name: OMIT,
                         last_name: OMIT, organization_name: OMIT, additional_properties: nil)
            @npi = npi if npi != OMIT
            @taxonomy_code = taxonomy_code if taxonomy_code != OMIT
            @address = address if address != OMIT
            @qualifier = qualifier if qualifier != OMIT
            @first_name = first_name if first_name != OMIT
            @last_name = last_name if last_name != OMIT
            @organization_name = organization_name if organization_name != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "npi": npi,
              "taxonomy_code": taxonomy_code,
              "address": address,
              "qualifier": qualifier,
              "first_name": first_name,
              "last_name": last_name,
              "organization_name": organization_name
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InitialReferringProviderUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            npi = struct["npi"]
            taxonomy_code = struct["taxonomy_code"]
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: address)
            end
            qualifier = struct["qualifier"]
            first_name = struct["first_name"]
            last_name = struct["last_name"]
            organization_name = struct["organization_name"]
            new(
              npi: npi,
              taxonomy_code: taxonomy_code,
              address: address,
              qualifier: qualifier,
              first_name: first_name,
              last_name: last_name,
              organization_name: organization_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of InitialReferringProviderUpdate to a JSON object
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
            obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            obj.taxonomy_code&.is_a?(String) != false || raise("Passed value for field obj.taxonomy_code is not the expected type, validation failed.")
            obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.address)
            obj.qualifier&.is_a?(CandidApiClient::Commons::Types::QualifierCode) != false || raise("Passed value for field obj.qualifier is not the expected type, validation failed.")
            obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
            obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
            obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
