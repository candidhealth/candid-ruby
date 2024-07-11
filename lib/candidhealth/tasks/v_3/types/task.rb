# frozen_string_literal: true

require_relative "../../commons/types/task_type"
require_relative "../../commons/types/task_status"
require_relative "task_note"
require "date"
require_relative "task_assignment"
require_relative "../../commons/types/task_category"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class Task
          # @return [String]
          attr_reader :task_id
          # @return [String]
          attr_reader :encounter_id
          # @return [CandidApiClient::Tasks::Commons::Types::TaskType]
          attr_reader :task_type
          # @return [String]
          attr_reader :description
          # @return [Boolean]
          attr_reader :blocks_claim_submission
          # @return [String]
          attr_reader :external_id
          # @return [String]
          attr_reader :patient_name
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :payer_name
          # @return [String]
          attr_reader :payer_id
          # @return [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          attr_reader :status
          # @return [Array<CandidApiClient::Tasks::V3::Types::TaskNote>]
          attr_reader :notes
          # @return [DateTime]
          attr_reader :created_at
          # @return [DateTime] The time of most recent update to the task only
          attr_reader :updated_at
          # @return [DateTime] The time of most recent update to the task or any of its notes
          attr_reader :agg_updated_at
          # @return [Date]
          attr_reader :date_of_service
          # @return [Array<CandidApiClient::Tasks::V3::Types::TaskAssignment>]
          attr_reader :assignments
          # @return [CandidApiClient::Tasks::Commons::Types::TaskCategory]
          attr_reader :category
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param task_id [String]
          # @param encounter_id [String]
          # @param task_type [CandidApiClient::Tasks::Commons::Types::TaskType]
          # @param description [String]
          # @param blocks_claim_submission [Boolean]
          # @param external_id [String]
          # @param patient_name [String]
          # @param patient_external_id [String]
          # @param payer_name [String]
          # @param payer_id [String]
          # @param status [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          # @param notes [Array<CandidApiClient::Tasks::V3::Types::TaskNote>]
          # @param created_at [DateTime]
          # @param updated_at [DateTime] The time of most recent update to the task only
          # @param agg_updated_at [DateTime] The time of most recent update to the task or any of its notes
          # @param date_of_service [Date]
          # @param assignments [Array<CandidApiClient::Tasks::V3::Types::TaskAssignment>]
          # @param category [CandidApiClient::Tasks::Commons::Types::TaskCategory]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::Task]
          def initialize(task_id:, encounter_id:, task_type:, description:, blocks_claim_submission:, external_id:,
                         patient_name:, patient_external_id:, status:, notes:, created_at:, updated_at:, agg_updated_at:, date_of_service:, assignments:, payer_name: OMIT, payer_id: OMIT, category: OMIT, additional_properties: nil)
            @task_id = task_id
            @encounter_id = encounter_id
            @task_type = task_type
            @description = description
            @blocks_claim_submission = blocks_claim_submission
            @external_id = external_id
            @patient_name = patient_name
            @patient_external_id = patient_external_id
            @payer_name = payer_name if payer_name != OMIT
            @payer_id = payer_id if payer_id != OMIT
            @status = status
            @notes = notes
            @created_at = created_at
            @updated_at = updated_at
            @agg_updated_at = agg_updated_at
            @date_of_service = date_of_service
            @assignments = assignments
            @category = category if category != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "task_id": task_id,
              "encounter_id": encounter_id,
              "task_type": task_type,
              "description": description,
              "blocks_claim_submission": blocks_claim_submission,
              "external_id": external_id,
              "patient_name": patient_name,
              "patient_external_id": patient_external_id,
              "payer_name": payer_name,
              "payer_id": payer_id,
              "status": status,
              "notes": notes,
              "created_at": created_at,
              "updated_at": updated_at,
              "agg_updated_at": agg_updated_at,
              "date_of_service": date_of_service,
              "assignments": assignments,
              "category": category
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Task
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::Task]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            task_id = struct["task_id"]
            encounter_id = struct["encounter_id"]
            task_type = struct["task_type"]
            description = struct["description"]
            blocks_claim_submission = struct["blocks_claim_submission"]
            external_id = struct["external_id"]
            patient_name = struct["patient_name"]
            patient_external_id = struct["patient_external_id"]
            payer_name = struct["payer_name"]
            payer_id = struct["payer_id"]
            status = struct["status"]
            notes = parsed_json["notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::Tasks::V3::Types::TaskNote.from_json(json_object: item)
            end
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
            updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
            agg_updated_at = (DateTime.parse(parsed_json["agg_updated_at"]) unless parsed_json["agg_updated_at"].nil?)
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            assignments = parsed_json["assignments"]&.map do |item|
              item = item.to_json
              CandidApiClient::Tasks::V3::Types::TaskAssignment.from_json(json_object: item)
            end
            category = struct["category"]
            new(
              task_id: task_id,
              encounter_id: encounter_id,
              task_type: task_type,
              description: description,
              blocks_claim_submission: blocks_claim_submission,
              external_id: external_id,
              patient_name: patient_name,
              patient_external_id: patient_external_id,
              payer_name: payer_name,
              payer_id: payer_id,
              status: status,
              notes: notes,
              created_at: created_at,
              updated_at: updated_at,
              agg_updated_at: agg_updated_at,
              date_of_service: date_of_service,
              assignments: assignments,
              category: category,
              additional_properties: struct
            )
          end

          # Serialize an instance of Task to a JSON object
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
            obj.task_id.is_a?(String) != false || raise("Passed value for field obj.task_id is not the expected type, validation failed.")
            obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.task_type.is_a?(CandidApiClient::Tasks::Commons::Types::TaskType) != false || raise("Passed value for field obj.task_type is not the expected type, validation failed.")
            obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.blocks_claim_submission.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
            obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.patient_name.is_a?(String) != false || raise("Passed value for field obj.patient_name is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.payer_name&.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
            obj.payer_id&.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::Tasks::Commons::Types::TaskStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.notes.is_a?(Array) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
            obj.agg_updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.agg_updated_at is not the expected type, validation failed.")
            obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.assignments.is_a?(Array) != false || raise("Passed value for field obj.assignments is not the expected type, validation failed.")
            obj.category&.is_a?(CandidApiClient::Tasks::Commons::Types::TaskCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
