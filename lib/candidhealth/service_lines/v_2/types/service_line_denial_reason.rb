# frozen_string_literal: true

require_relative "denial_reason_content"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      # The reason a given service line was denied within a given time range.
      # A service line may be denied for different reasons over time, but only one reason at a time.
      class ServiceLineDenialReason
        attr_reader :reason, :additional_properties

        # @param reason [ServiceLines::V2::DenialReasonContent] Text of the denial reason
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::ServiceLineDenialReason]
        def initialize(reason: nil, additional_properties: nil)
          # @type [ServiceLines::V2::DenialReasonContent] Text of the denial reason
          @reason = reason
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLineDenialReason
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::ServiceLineDenialReason]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          reason = struct.reason
          new(reason: reason, additional_properties: struct)
        end

        # Serialize an instance of ServiceLineDenialReason to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "reason": @reason }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.reason&.is_a?(ServiceLines::V2::DenialReasonContent) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
        end
      end
    end
  end
end
