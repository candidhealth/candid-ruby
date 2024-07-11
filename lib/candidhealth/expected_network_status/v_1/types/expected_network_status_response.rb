# frozen_string_literal: true

require_relative "expected_network_status"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V1
      module Types
        class ExpectedNetworkStatusResponse
          # @return [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatus] The anticipated classification of a healthcare provider within the insurance
          #  plan's network.
          attr_reader :expected_network_status
          # @return [String]
          attr_reader :explanation
          # @return [String]
          attr_reader :contract_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param expected_network_status [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatus] The anticipated classification of a healthcare provider within the insurance
          #  plan's network.
          # @param explanation [String]
          # @param contract_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse]
          def initialize(expected_network_status:, explanation:, contract_id: OMIT, additional_properties: nil)
            @expected_network_status = expected_network_status
            @explanation = explanation
            @contract_id = contract_id if contract_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "expected_network_status": expected_network_status,
              "explanation": explanation,
              "contract_id": contract_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ExpectedNetworkStatusResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            expected_network_status = struct["expected_network_status"]
            explanation = struct["explanation"]
            contract_id = struct["contract_id"]
            new(
              expected_network_status: expected_network_status,
              explanation: explanation,
              contract_id: contract_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExpectedNetworkStatusResponse to a JSON object
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
            obj.expected_network_status.is_a?(CandidApiClient::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatus) != false || raise("Passed value for field obj.expected_network_status is not the expected type, validation failed.")
            obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
            obj.contract_id&.is_a?(String) != false || raise("Passed value for field obj.contract_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
