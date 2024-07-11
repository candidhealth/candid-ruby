# frozen_string_literal: true

require_relative "task_action_execution_method"
require_relative "task_action_type"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskAction
          # @return [String]
          attr_reader :display_name
          # @return [CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod]
          attr_reader :execution_method
          # @return [CandidApiClient::Tasks::V3::Types::TaskActionType]
          attr_reader :type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param display_name [String]
          # @param execution_method [CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod]
          # @param type [CandidApiClient::Tasks::V3::Types::TaskActionType]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskAction]
          def initialize(display_name:, execution_method:, type:, additional_properties: nil)
            @display_name = display_name
            @execution_method = execution_method
            @type = type
            @additional_properties = additional_properties
            @_field_set = { "display_name": display_name, "execution_method": execution_method, "type": type }
          end

          # Deserialize a JSON object to an instance of TaskAction
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskAction]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            display_name = struct["display_name"]
            if parsed_json["execution_method"].nil?
              execution_method = nil
            else
              execution_method = parsed_json["execution_method"].to_json
              execution_method = CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod.from_json(json_object: execution_method)
            end
            type = struct["type"]
            new(
              display_name: display_name,
              execution_method: execution_method,
              type: type,
              additional_properties: struct
            )
          end

          # Serialize an instance of TaskAction to a JSON object
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
            obj.display_name.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
            CandidApiClient::Tasks::V3::Types::TaskActionExecutionMethod.validate_raw(obj: obj.execution_method)
            obj.type.is_a?(CandidApiClient::Tasks::V3::Types::TaskActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
