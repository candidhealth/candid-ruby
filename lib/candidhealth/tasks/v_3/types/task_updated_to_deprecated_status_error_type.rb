# frozen_string_literal: true

require_relative "../../commons/types/task_status"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskUpdatedToDeprecatedStatusErrorType
          # @return [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          attr_reader :deprecated_status
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param deprecated_status [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskUpdatedToDeprecatedStatusErrorType]
          def initialize(deprecated_status: OMIT, additional_properties: nil)
            @deprecated_status = deprecated_status if deprecated_status != OMIT
            @additional_properties = additional_properties
            @_field_set = { "deprecated_status": deprecated_status }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of
          #  TaskUpdatedToDeprecatedStatusErrorType
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskUpdatedToDeprecatedStatusErrorType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            deprecated_status = struct["deprecated_status"]
            new(deprecated_status: deprecated_status, additional_properties: struct)
          end

          # Serialize an instance of TaskUpdatedToDeprecatedStatusErrorType to a JSON object
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
            obj.deprecated_status&.is_a?(CandidApiClient::Tasks::Commons::Types::TaskStatus) != false || raise("Passed value for field obj.deprecated_status is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
