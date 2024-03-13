# frozen_string_literal: true

require_relative "../../commons/types/task_status"
require_relative "../../../commons/types/user_id"
require "json"

module CandidApiClient
  module Tasks
    module V3
      class TaskUpdateV3
        attr_reader :status, :assignee_user_id, :blocks_claim_submission, :additional_properties

        # @param status [Tasks::Commons::TaskStatus]
        # @param assignee_user_id [Commons::USER_ID]
        # @param blocks_claim_submission [Boolean]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Tasks::V3::TaskUpdateV3]
        def initialize(status: nil, assignee_user_id: nil, blocks_claim_submission: nil, additional_properties: nil)
          # @type [Tasks::Commons::TaskStatus]
          @status = status
          # @type [Commons::USER_ID]
          @assignee_user_id = assignee_user_id
          # @type [Boolean]
          @blocks_claim_submission = blocks_claim_submission
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TaskUpdateV3
        #
        # @param json_object [JSON]
        # @return [Tasks::V3::TaskUpdateV3]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          status = struct.status
          assignee_user_id = struct.assignee_user_id
          blocks_claim_submission = struct.blocks_claim_submission
          new(status: status, assignee_user_id: assignee_user_id, blocks_claim_submission: blocks_claim_submission,
              additional_properties: struct)
        end

        # Serialize an instance of TaskUpdateV3 to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "status": @status,
            "assignee_user_id": @assignee_user_id,
            "blocks_claim_submission": @blocks_claim_submission
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.status&.is_a?(Tasks::Commons::TaskStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.assignee_user_id&.is_a?(String) != false || raise("Passed value for field obj.assignee_user_id is not the expected type, validation failed.")
          obj.blocks_claim_submission&.is_a?(Boolean) != false || raise("Passed value for field obj.blocks_claim_submission is not the expected type, validation failed.")
        end
      end
    end
  end
end
