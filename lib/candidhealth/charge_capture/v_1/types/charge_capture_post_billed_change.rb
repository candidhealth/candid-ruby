# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ChargeCapture
    module V1
      module Types
        # ChargeCapturePostBilledChange represents a change to a ChargeCapture that
        #  occurred after the ChargeCapture's status moved to BILLED. Action must be taken
        #  to resolve the update, and then the update should be marked as resolved.
        class ChargeCapturePostBilledChange
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :message
          # @return [Boolean]
          attr_reader :resolved
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param message [String]
          # @param resolved [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]
          def initialize(id:, message:, resolved:, additional_properties: nil)
            @id = id
            @message = message
            @resolved = resolved
            @additional_properties = additional_properties
            @_field_set = { "id": id, "message": message, "resolved": resolved }
          end

          # Deserialize a JSON object to an instance of ChargeCapturePostBilledChange
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            id = struct["id"]
            message = struct["message"]
            resolved = struct["resolved"]
            new(
              id: id,
              message: message,
              resolved: resolved,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCapturePostBilledChange to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            obj.resolved.is_a?(Boolean) != false || raise("Passed value for field obj.resolved is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
