# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Financials
    module Types
      class ServiceLineAllocationTarget
        # @return [String]
        attr_reader :service_line_id
        # @return [String]
        attr_reader :claim_id
        # @return [String]
        attr_reader :encounter_id
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param service_line_id [String]
        # @param claim_id [String]
        # @param encounter_id [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Financials::Types::ServiceLineAllocationTarget]
        def initialize(service_line_id:, claim_id:, encounter_id:, additional_properties: nil)
          @service_line_id = service_line_id
          @claim_id = claim_id
          @encounter_id = encounter_id
          @additional_properties = additional_properties
          @_field_set = { "service_line_id": service_line_id, "claim_id": claim_id, "encounter_id": encounter_id }
        end

        # Deserialize a JSON object to an instance of ServiceLineAllocationTarget
        #
        # @param json_object [String]
        # @return [CandidApiClient::Financials::Types::ServiceLineAllocationTarget]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          service_line_id = struct["service_line_id"]
          claim_id = struct["claim_id"]
          encounter_id = struct["encounter_id"]
          new(
            service_line_id: service_line_id,
            claim_id: claim_id,
            encounter_id: encounter_id,
            additional_properties: struct
          )
        end

        # Serialize an instance of ServiceLineAllocationTarget to a JSON object
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
          obj.service_line_id.is_a?(String) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
          obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
