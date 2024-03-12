# frozen_string_literal: true

require_relative "../../../commons/types/task_assignment_id"
require_relative "../../../commons/types/user_id"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskAssignment
        attr_reader :task_assignment_id, :assignee_user_id, :additional_properties

        # @param task_assignment_id [Commons::TASK_ASSIGNMENT_ID]
        # @param assignee_user_id [Commons::USER_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskAssignment]
        def initialize(task_assignment_id:, assignee_user_id: nil, additional_properties: nil)
          # @type [Commons::TASK_ASSIGNMENT_ID]
          @task_assignment_id = task_assignment_id
          # @type [Commons::USER_ID]
          @assignee_user_id = assignee_user_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskAssignment
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskAssignment]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          task_assignment_id = struct.task_assignment_id
          assignee_user_id = struct.assignee_user_id
          new(task_assignment_id: task_assignment_id, assignee_user_id: assignee_user_id, additional_properties: struct)
        end

        # Serialize an instance of TaskAssignment to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "task_assignment_id": @task_assignment_id, "assignee_user_id": @assignee_user_id }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.task_assignment_id.is_a?(UUID) != false || raise("Passed value for field obj.task_assignment_id is not the expected type, validation failed.")
          obj.assignee_user_id&.is_a?(UUID) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
