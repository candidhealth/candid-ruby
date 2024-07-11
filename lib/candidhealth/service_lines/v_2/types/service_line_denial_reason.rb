# frozen_string_literal: true

require_relative "denial_reason_content"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        # The reason a given service line was denied within a given time range.
        #  A service line may be denied for different reasons over time, but only one
        #  reason at a time.
        class ServiceLineDenialReason
          # @return [CandidApiClient::ServiceLines::V2::Types::DenialReasonContent] Text of the denial reason
          attr_reader :reason
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param reason [CandidApiClient::ServiceLines::V2::Types::DenialReasonContent] Text of the denial reason
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          def initialize(reason: OMIT, additional_properties: nil)
            @reason = reason if reason != OMIT
            @additional_properties = additional_properties
            @_field_set = { "reason": reason }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLineDenialReason
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            reason = struct["reason"]
            new(reason: reason, additional_properties: struct)
          end

          # Serialize an instance of ServiceLineDenialReason to a JSON object
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
            obj.reason&.is_a?(CandidApiClient::ServiceLines::V2::Types::DenialReasonContent) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
