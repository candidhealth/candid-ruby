# frozen_string_literal: true

require_relative "../../../commons/types/task_id"
require_relative "../../../commons/types/encounter_id"
require_relative "../../commons/types/task_type"
require_relative "../../commons/types/task_status"
require_relative "task_note"
require "date"
require_relative "task_assignment"
require_relative "../../commons/types/task_category"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class Task
        attr_reader :task_id, :encounter_id, :task_type, :description, :blocks_claim_submission, :external_id,
                    :patient_name, :patient_external_id, :payer_name, :payer_id, :status, :notes, :created_at, :updated_at, :agg_updated_at, :date_of_service, :assignments, :category, :additional_properties

        # @param task_id [Commons::TASK_ID]
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param task_type [Tasks::Commons::TaskType]
        # @param description [String]
        # @param blocks_claim_submission [Boolean]
        # @param external_id [String]
        # @param patient_name [String]
        # @param patient_external_id [String]
        # @param payer_name [String]
        # @param payer_id [String]
        # @param status [Tasks::Commons::TaskStatus]
        # @param notes [Array<Tasks::V3::TaskNote>]
        # @param created_at [DateTime]
        # @param updated_at [DateTime] The time of most recent update to the task only
        # @param agg_updated_at [DateTime] The time of most recent update to the task or any of its notes
        # @param date_of_service [Date]
        # @param assignments [Array<Tasks::V3::TaskAssignment>]
        # @param category [Tasks::Commons::TaskCategory]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::Task]
        def initialize(task_id:, encounter_id:, task_type:, description:, blocks_claim_submission:, external_id:,
                       patient_name:, patient_external_id:, status:, notes:, created_at:, updated_at:, agg_updated_at:, date_of_service:, assignments:, payer_name: nil, payer_id: nil, category: nil, additional_properties: nil)
          # @type [Commons::TASK_ID]
          @task_id = task_id
          # @type [Commons::ENCOUNTER_ID]
          @encounter_id = encounter_id
          # @type [Tasks::Commons::TaskType]
          @task_type = task_type
          # @type [String]
          @description = description
          # @type [Boolean]
          @blocks_claim_submission = blocks_claim_submission
          # @type [String]
          @external_id = external_id
          # @type [String]
          @patient_name = patient_name
          # @type [String]
          @patient_external_id = patient_external_id
          # @type [String]
          @payer_name = payer_name
          # @type [String]
          @payer_id = payer_id
          # @type [Tasks::Commons::TaskStatus]
          @status = status
          # @type [Array<Tasks::V3::TaskNote>]
          @notes = notes
          # @type [DateTime]
          @created_at = created_at
          # @type [DateTime] The time of most recent update to the task only
          @updated_at = updated_at
          # @type [DateTime] The time of most recent update to the task or any of its notes
          @agg_updated_at = agg_updated_at
          # @type [Date]
          @date_of_service = date_of_service
          # @type [Array<Tasks::V3::TaskAssignment>]
          @assignments = assignments
          # @type [Tasks::Commons::TaskCategory]
          @category = category
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Task
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::Task]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          task_id = struct.task_id
          encounter_id = struct.encounter_id
          task_type = struct.task_type
          description = struct.description
          blocks_claim_submission = struct.blocks_claim_submission
          external_id = struct.external_id
          patient_name = struct.patient_name
          patient_external_id = struct.patient_external_id
          payer_name = struct.payer_name
          payer_id = struct.payer_id
          status = struct.status
          notes = parsed_json["notes"]&.map do |v|
            v = v.to_json
            Tasks::V3::TaskNote.from_json(json_object: v)
          end
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          agg_updated_at = (DateTime.parse(parsed_json["agg_updated_at"]) unless parsed_json["agg_updated_at"].nil?)
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          assignments = parsed_json["assignments"]&.map do |v|
            v = v.to_json
            Tasks::V3::TaskAssignment.from_json(json_object: v)
          end
          category = struct.category
          new(task_id: task_id, encounter_id: encounter_id, task_type: task_type, description: description,
              blocks_claim_submission: blocks_claim_submission, external_id: external_id, patient_name: patient_name, patient_external_id: patient_external_id, payer_name: payer_name, payer_id: payer_id, status: status, notes: notes, created_at: created_at, updated_at: updated_at, agg_updated_at: agg_updated_at, date_of_service: date_of_service, assignments: assignments, category: category, additional_properties: struct)
        end

        # Serialize an instance of Task to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "task_id": @task_id,
            "encounter_id": @encounter_id,
            "task_type": @task_type,
            "description": @description,
            "blocks_claim_submission": @blocks_claim_submission,
            "external_id": @external_id,
            "patient_name": @patient_name,
            "patient_external_id": @patient_external_id,
            "payer_name": @payer_name,
            "payer_id": @payer_id,
            "status": @status,
            "notes": @notes,
            "created_at": @created_at,
            "updated_at": @updated_at,
            "agg_updated_at": @agg_updated_at,
            "date_of_service": @date_of_service,
            "assignments": @assignments,
            "category": @category
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.task_id.is_a?(String) != false || raise("Passed value for field obj.task_id is not the expected type, validation failed.")
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.task_type.is_a?(Tasks::Commons::TaskType) != false || raise("Passed value for field obj.task_type is not the expected type, validation failed.")
          obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.blocks_claim_submission.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.patient_name.is_a?(String) != false || raise("Passed value for field obj.patient_name is not the expected type, validation failed.")
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.payer_name&.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
          obj.payer_id&.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
          obj.status.is_a?(Tasks::Commons::TaskStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.notes.is_a?(Array) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          obj.agg_updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.agg_updated_at is not the expected type, validation failed.")
          obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.assignments.is_a?(Array) != false || raise("Passed value for field obj.assignments is not the expected type, validation failed.")
          obj.category&.is_a?(Tasks::Commons::TaskCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
        end
      end
    end
  end
end
