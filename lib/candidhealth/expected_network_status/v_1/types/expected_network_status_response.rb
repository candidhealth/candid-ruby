# frozen_string_literal: true

require_relative "expected_network_status"
require_relative "../../../contracts/v_2/types/contract_id"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V1
      class ExpectedNetworkStatusResponse
        attr_reader :expected_network_status, :explanation, :contract_id, :additional_properties

        # @param expected_network_status [ExpectedNetworkStatus::V1::ExpectedNetworkStatus] The anticipated classification of a healthcare provider within the insurance plan's network.
        # @param explanation [String]
        # @param contract_id [Contracts::V2::CONTRACT_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse]
        def initialize(expected_network_status:, explanation:, contract_id: nil, additional_properties: nil)
          # @type [ExpectedNetworkStatus::V1::ExpectedNetworkStatus] The anticipated classification of a healthcare provider within the insurance plan's network.
          @expected_network_status = expected_network_status
          # @type [String]
          @explanation = explanation
          # @type [Contracts::V2::CONTRACT_ID]
          @contract_id = contract_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ExpectedNetworkStatusResponse
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V1::ExpectedNetworkStatusResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          expected_network_status = struct.expected_network_status
          explanation = struct.explanation
          contract_id = struct.contract_id
          new(expected_network_status: expected_network_status, explanation: explanation, contract_id: contract_id,
              additional_properties: struct)
        end

        # Serialize an instance of ExpectedNetworkStatusResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "expected_network_status": @expected_network_status,
            "explanation": @explanation,
            "contract_id": @contract_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.expected_network_status.is_a?(ExpectedNetworkStatus::V1::ExpectedNetworkStatus) != false || raise("Passed value for field obj.expected_network_status is not the expected type, validation failed.")
          obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
          obj.contract_id&.is_a?(UUID) != false || raise("Passed value for field obj.contract_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
