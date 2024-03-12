# frozen_string_literal: true

require_relative "../../commons/types/claim_id"
require "json"

module CandidApiClient
  class Era
    class EraNotFullyProcessedErrorMessage
      attr_reader :claim_id, :message, :additional_properties

      # @param claim_id [Commons::CLAIM_ID]
      # @param message [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Era::EraNotFullyProcessedErrorMessage]
      def initialize(claim_id:, message:, additional_properties: nil)
        # @type [Commons::CLAIM_ID]
        @claim_id = claim_id
        # @type [String]
        @message = message
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EraNotFullyProcessedErrorMessage
      #
      # @param json_object [JSON]
      # @return [Era::EraNotFullyProcessedErrorMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        claim_id = struct.claim_id
        message = struct.message
        new(claim_id: claim_id, message: message, additional_properties: struct)
      end

      # Serialize an instance of EraNotFullyProcessedErrorMessage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "claim_id": @claim_id, "message": @message }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.claim_id.is_a?(UUID) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
        obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
