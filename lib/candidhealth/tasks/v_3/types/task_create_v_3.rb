# frozen_string_literal: true

require_relative "../../commons/types/task_type"
require_relative "../../commons/types/task_category"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskCreateV3
          # @return [String]
          attr_reader :encounter_id
          # @return [CandidApiClient::Tasks::Commons::Types::TaskType]
          attr_reader :task_type
          # @return [String]
          attr_reader :description
          # @return [Boolean]
          attr_reader :blocks_claim_submission
          # @return [String]
          attr_reader :assignee_user_id
          # @return [CandidApiClient::Tasks::Commons::Types::TaskCategory]
          attr_reader :category
          # @return [String]
          attr_reader :work_queue_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param encounter_id [String]
          # @param task_type [CandidApiClient::Tasks::Commons::Types::TaskType]
          # @param description [String]
          # @param blocks_claim_submission [Boolean]
          # @param assignee_user_id [String]
          # @param category [CandidApiClient::Tasks::Commons::Types::TaskCategory]
          # @param work_queue_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskCreateV3]
          def initialize(encounter_id:, task_type:, description:, work_queue_id:, blocks_claim_submission: OMIT,
                         assignee_user_id: OMIT, category: OMIT, additional_properties: nil)
            @encounter_id = encounter_id
            @task_type = task_type
            @description = description
            @blocks_claim_submission = blocks_claim_submission if blocks_claim_submission != OMIT
            @assignee_user_id = assignee_user_id if assignee_user_id != OMIT
            @category = category if category != OMIT
            @work_queue_id = work_queue_id
            @additional_properties = additional_properties
            @_field_set = {
              "encounter_id": encounter_id,
              "task_type": task_type,
              "description": description,
              "blocks_claim_submission": blocks_claim_submission,
              "assignee_user_id": assignee_user_id,
              "category": category,
              "work_queue_id": work_queue_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TaskCreateV3
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskCreateV3]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            encounter_id = struct["encounter_id"]
            task_type = struct["task_type"]
            description = struct["description"]
            blocks_claim_submission = struct["blocks_claim_submission"]
            assignee_user_id = struct["assignee_user_id"]
            category = struct["category"]
            work_queue_id = struct["work_queue_id"]
            new(
              encounter_id: encounter_id,
              task_type: task_type,
              description: description,
              blocks_claim_submission: blocks_claim_submission,
              assignee_user_id: assignee_user_id,
              category: category,
              work_queue_id: work_queue_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of TaskCreateV3 to a JSON object
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
            obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.task_type.is_a?(CandidApiClient::Tasks::Commons::Types::TaskType) != false || raise("Passed value for field obj.task_type is not the expected type, validation failed.")
            obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.blocks_claim_submission&.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
            obj.assignee_user_id&.is_a?(String) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
            obj.category&.is_a?(CandidApiClient::Tasks::Commons::Types::TaskCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.work_queue_id.is_a?(String) != false || raise("Passed value for field obj.work_queue_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
