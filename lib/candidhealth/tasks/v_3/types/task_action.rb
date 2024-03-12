# frozen_string_literal: true

require_relative "task_action_execution_method"
require_relative "task_action_type"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskAction
        attr_reader :display_name, :execution_method, :type, :additional_properties

        # @param display_name [String]
        # @param execution_method [Tasks::V3::TaskActionExecutionMethod]
        # @param type [Tasks::V3::TaskActionType]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskAction]
        def initialize(display_name:, execution_method:, type:, additional_properties: nil)
          # @type [String]
          @display_name = display_name
          # @type [Tasks::V3::TaskActionExecutionMethod]
          @execution_method = execution_method
          # @type [Tasks::V3::TaskActionType]
          @type = type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskAction
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskAction]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          display_name = struct.display_name
          if parsed_json["execution_method"].nil?
            execution_method = nil
          else
            execution_method = parsed_json["execution_method"].to_json
            execution_method = Tasks::V3::TaskActionExecutionMethod.from_json(json_object: execution_method)
          end
          type = struct.type
          new(display_name: display_name, execution_method: execution_method, type: type, additional_properties: struct)
        end

        # Serialize an instance of TaskAction to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "display_name": @display_name, "execution_method": @execution_method, "type": @type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.display_name.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
          Tasks::V3::TaskActionExecutionMethod.validate_raw(obj: obj.execution_method)
          obj.type.is_a?(Tasks::V3::TaskActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        end
      end
    end
  end
end
