# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskAssignment
          # @return [String]
          attr_reader :task_assignment_id
          # @return [String]
          attr_reader :assignee_user_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param task_assignment_id [String]
          # @param assignee_user_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskAssignment]
          def initialize(task_assignment_id:, assignee_user_id: OMIT, additional_properties: nil)
            @task_assignment_id = task_assignment_id
            @assignee_user_id = assignee_user_id if assignee_user_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "task_assignment_id": task_assignment_id,
              "assignee_user_id": assignee_user_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TaskAssignment
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskAssignment]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            task_assignment_id = struct["task_assignment_id"]
            assignee_user_id = struct["assignee_user_id"]
            new(
              task_assignment_id: task_assignment_id,
              assignee_user_id: assignee_user_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of TaskAssignment to a JSON object
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
            obj.task_assignment_id.is_a?(String) != false || raise("Passed value for field obj.task_assignment_id is not the expected type, validation failed.")
            obj.assignee_user_id&.is_a?(String) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
