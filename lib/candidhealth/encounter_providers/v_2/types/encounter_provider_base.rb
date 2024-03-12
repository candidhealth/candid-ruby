# frozen_string_literal: true

require "json"

module CandidApiClient
  module EncounterProviders
    module V2
      class EncounterProviderBase
        attr_reader :first_name, :last_name, :organization_name, :additional_properties

        # @param first_name [String] If the provider is an individual, this should be set instead of organization name
        # @param last_name [String] If the provider is an individual, this should be set instead of organization name
        # @param organization_name [String] If the provider is an organization, this should be set instead of first + last name
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [EncounterProviders::V2::EncounterProviderBase]
        def initialize(first_name: nil, last_name: nil, organization_name: nil, additional_properties: nil)
          # @type [String] If the provider is an individual, this should be set instead of organization name
          @first_name = first_name
          # @type [String] If the provider is an individual, this should be set instead of organization name
          @last_name = last_name
          # @type [String] If the provider is an organization, this should be set instead of first + last name
          @organization_name = organization_name
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of EncounterProviderBase
        #
        # @param json_object [JSON]
        # @return [EncounterProviders::V2::EncounterProviderBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          first_name = struct.first_name
          last_name = struct.last_name
          organization_name = struct.organization_name
          new(first_name: first_name, last_name: last_name, organization_name: organization_name,
              additional_properties: struct)
        end

        # Serialize an instance of EncounterProviderBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "first_name": @first_name, "last_name": @last_name, "organization_name": @organization_name }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
