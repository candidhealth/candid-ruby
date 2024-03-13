# frozen_string_literal: true

require_relative "../../commons/types/claim_id"
require_relative "../../commons/types/encounter_id"
require "json"

module CandidApiClient
  class Financials
    class ClaimAllocationTarget
      attr_reader :claim_id, :encounter_id, :additional_properties

      # @param claim_id [Commons::CLAIM_ID]
      # @param encounter_id [Commons::ENCOUNTER_ID]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Financials::ClaimAllocationTarget]
      def initialize(claim_id:, encounter_id:, additional_properties: nil)
        # @type [Commons::CLAIM_ID]
        @claim_id = claim_id
        # @type [Commons::ENCOUNTER_ID]
        @encounter_id = encounter_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ClaimAllocationTarget
      #
      # @param json_object [JSON]
      # @return [Financials::ClaimAllocationTarget]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        claim_id = struct.claim_id
        encounter_id = struct.encounter_id
        new(claim_id: claim_id, encounter_id: encounter_id, additional_properties: struct)
      end

      # Serialize an instance of ClaimAllocationTarget to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "claim_id": @claim_id, "encounter_id": @encounter_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
        obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
      end
    end
  end
end
