# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class OrganizationProvider
            # @return [String]
            attr_reader :organization_name
            # @return [String]
            attr_reader :npi
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param organization_name [String]
            # @param npi [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider]
            def initialize(npi:, organization_name: OMIT, additional_properties: nil)
              @organization_name = organization_name if organization_name != OMIT
              @npi = npi
              @additional_properties = additional_properties
              @_field_set = { "organization_name": organization_name, "npi": npi }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of OrganizationProvider
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              organization_name = struct["organization_name"]
              npi = struct["npi"]
              new(
                organization_name: organization_name,
                npi: npi,
                additional_properties: struct
              )
            end

            # Serialize an instance of OrganizationProvider to a JSON object
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
              obj.npi.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
