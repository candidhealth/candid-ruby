# frozen_string_literal: true

require_relative "../../commons/types/task_status"
require "ostruct"
require "json"

module CandidApiClient
  module Tasks
    module V3
      module Types
        class TaskUpdateV3
          # @return [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          attr_reader :status
          # @return [String]
          attr_reader :assignee_user_id
          # @return [Boolean]
          attr_reader :blocks_claim_submission
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param status [CandidApiClient::Tasks::Commons::Types::TaskStatus]
          # @param assignee_user_id [String]
          # @param blocks_claim_submission [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Tasks::V3::Types::TaskUpdateV3]
          def initialize(status: OMIT, assignee_user_id: OMIT, blocks_claim_submission: OMIT,
                         additional_properties: nil)
            @status = status if status != OMIT
            @assignee_user_id = assignee_user_id if assignee_user_id != OMIT
            @blocks_claim_submission = blocks_claim_submission if blocks_claim_submission != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "status": status,
              "assignee_user_id": assignee_user_id,
              "blocks_claim_submission": blocks_claim_submission
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TaskUpdateV3
          #
          # @param json_object [String]
          # @return [CandidApiClient::Tasks::V3::Types::TaskUpdateV3]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            status = struct["status"]
            assignee_user_id = struct["assignee_user_id"]
            blocks_claim_submission = struct["blocks_claim_submission"]
            new(
              status: status,
              assignee_user_id: assignee_user_id,
              blocks_claim_submission: blocks_claim_submission,
              additional_properties: struct
            )
          end

          # Serialize an instance of TaskUpdateV3 to a JSON object
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
            obj.status&.is_a?(CandidApiClient::Tasks::Commons::Types::TaskStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.assignee_user_id&.is_a?(String) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
            obj.blocks_claim_submission&.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
