# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Era
    module Types
      class EraNotFullyProcessedErrorMessage
        # @return [String]
        attr_reader :claim_id
        # @return [String]
        attr_reader :message
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param claim_id [String]
        # @param message [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Era::Types::EraNotFullyProcessedErrorMessage]
        def initialize(claim_id:, message:, additional_properties: nil)
          @claim_id = claim_id
          @message = message
          @additional_properties = additional_properties
          @_field_set = { "claim_id": claim_id, "message": message }
        end

        # Deserialize a JSON object to an instance of EraNotFullyProcessedErrorMessage
        #
        # @param json_object [String]
        # @return [CandidApiClient::Era::Types::EraNotFullyProcessedErrorMessage]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          claim_id = struct["claim_id"]
          message = struct["message"]
          new(
            claim_id: claim_id,
            message: message,
            additional_properties: struct
          )
        end

        # Serialize an instance of EraNotFullyProcessedErrorMessage to a JSON object
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
          obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
          obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
        end
      end
    end
  end
end
