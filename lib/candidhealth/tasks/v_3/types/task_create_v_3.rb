# frozen_string_literal: true

require_relative "../../../commons/types/encounter_id"
require_relative "../../commons/types/task_type"
require_relative "../../../commons/types/user_id"
require_relative "../../commons/types/task_category"
require_relative "../../../commons/types/work_queue_id"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskCreateV3
        attr_reader :encounter_id, :task_type, :description, :blocks_claim_submission, :assignee_user_id, :category,
                    :work_queue_id, :additional_properties

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param task_type [Tasks::Commons::TaskType]
        # @param description [String]
        # @param blocks_claim_submission [Boolean]
        # @param assignee_user_id [Commons::USER_ID]
        # @param category [Tasks::Commons::TaskCategory]
        # @param work_queue_id [Commons::WORK_QUEUE_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskCreateV3]
        def initialize(encounter_id:, task_type:, description:, work_queue_id:, blocks_claim_submission: nil, assignee_user_id: nil,
                       category: nil, additional_properties: nil)
          # @type [Commons::ENCOUNTER_ID]
          @encounter_id = encounter_id
          # @type [Tasks::Commons::TaskType]
          @task_type = task_type
          # @type [String]
          @description = description
          # @type [Boolean]
          @blocks_claim_submission = blocks_claim_submission
          # @type [Commons::USER_ID]
          @assignee_user_id = assignee_user_id
          # @type [Tasks::Commons::TaskCategory]
          @category = category
          # @type [Commons::WORK_QUEUE_ID]
          @work_queue_id = work_queue_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskCreateV3
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskCreateV3]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          encounter_id = struct.encounter_id
          task_type = struct.task_type
          description = struct.description
          blocks_claim_submission = struct.blocks_claim_submission
          assignee_user_id = struct.assignee_user_id
          category = struct.category
          work_queue_id = struct.work_queue_id
          new(encounter_id: encounter_id, task_type: task_type, description: description,
              blocks_claim_submission: blocks_claim_submission, assignee_user_id: assignee_user_id, category: category, work_queue_id: work_queue_id, additional_properties: struct)
        end

        # Serialize an instance of TaskCreateV3 to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "encounter_id": @encounter_id,
            "task_type": @task_type,
            "description": @description,
            "blocks_claim_submission": @blocks_claim_submission,
            "assignee_user_id": @assignee_user_id,
            "category": @category,
            "work_queue_id": @work_queue_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.task_type.is_a?(Tasks::Commons::TaskType) != false || raise("Passed value for field obj.task_type is not the expected type, validation failed.")
          obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.blocks_claim_submission&.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
          obj.assignee_user_id&.is_a?(String) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
          obj.category&.is_a?(Tasks::Commons::TaskCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
          obj.work_queue_id.is_a?(String) != false || raise("Passed value for field obj.work_queue_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
