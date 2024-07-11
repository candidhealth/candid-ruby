# frozen_string_literal: true

require_relative "expected_network_status_v_2"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusResponseV2
          # @return [String]
          attr_reader :network_status_check_id
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          attr_reader :network_status
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param network_status_check_id [String]
          # @param network_status [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2]
          def initialize(network_status_check_id:, network_status:, additional_properties: nil)
            @network_status_check_id = network_status_check_id
            @network_status = network_status
            @additional_properties = additional_properties
            @_field_set = { "network_status_check_id": network_status_check_id, "network_status": network_status }
          end

          # Deserialize a JSON object to an instance of ExpectedNetworkStatusResponseV2
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            network_status_check_id = struct["network_status_check_id"]
            if parsed_json["network_status"].nil?
              network_status = nil
            else
              network_status = parsed_json["network_status"].to_json
              network_status = CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2.from_json(json_object: network_status)
            end
            new(
              network_status_check_id: network_status_check_id,
              network_status: network_status,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExpectedNetworkStatusResponseV2 to a JSON object
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
            obj.network_status_check_id.is_a?(String) != false || raise("Passed value for field obj.network_status_check_id is not the expected type, validation failed.")
            CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2.validate_raw(obj: obj.network_status)
          end
        end
      end
    end
  end
end
