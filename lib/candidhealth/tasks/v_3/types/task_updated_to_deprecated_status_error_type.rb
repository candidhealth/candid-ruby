# frozen_string_literal: true

require_relative "../../commons/types/task_status"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskUpdatedToDeprecatedStatusErrorType
        attr_reader :deprecated_status, :additional_properties

        # @param deprecated_status [Tasks::Commons::TaskStatus]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskUpdatedToDeprecatedStatusErrorType]
        def initialize(deprecated_status: nil, additional_properties: nil)
          # @type [Tasks::Commons::TaskStatus]
          @deprecated_status = deprecated_status
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskUpdatedToDeprecatedStatusErrorType
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskUpdatedToDeprecatedStatusErrorType]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          deprecated_status = struct.deprecated_status
          new(deprecated_status: deprecated_status, additional_properties: struct)
        end

        # Serialize an instance of TaskUpdatedToDeprecatedStatusErrorType to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "deprecated_status": @deprecated_status }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.deprecated_status&.is_a?(Tasks::Commons::TaskStatus) != false || raise("Passed value for field obj.deprecated_status is not the expected type, validation failed.")
        end
      end
    end
  end
end
