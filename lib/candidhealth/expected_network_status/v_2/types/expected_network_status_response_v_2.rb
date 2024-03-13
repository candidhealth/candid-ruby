# frozen_string_literal: true

require_relative "network_status_check_id"
require_relative "expected_network_status_v_2"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ExpectedNetworkStatusResponseV2
        attr_reader :network_status_check_id, :network_status, :additional_properties

        # @param network_status_check_id [ExpectedNetworkStatus::V2::NETWORK_STATUS_CHECK_ID]
        # @param network_status [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2]
        def initialize(network_status_check_id:, network_status:, additional_properties: nil)
          # @type [ExpectedNetworkStatus::V2::NETWORK_STATUS_CHECK_ID]
          @network_status_check_id = network_status_check_id
          # @type [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
          @network_status = network_status
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ExpectedNetworkStatusResponseV2
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusResponseV2]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          network_status_check_id = struct.network_status_check_id
          if parsed_json["network_status"].nil?
            network_status = nil
          else
            network_status = parsed_json["network_status"].to_json
            network_status = ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2.from_json(json_object: network_status)
          end
          new(network_status_check_id: network_status_check_id, network_status: network_status,
              additional_properties: struct)
        end

        # Serialize an instance of ExpectedNetworkStatusResponseV2 to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "network_status_check_id": @network_status_check_id, "network_status": @network_status }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.network_status_check_id.is_a?(String) != false || raise("Passed value for field obj.network_status_check_id is not the expected type, validation failed.")
          ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2.validate_raw(obj: obj.network_status)
        end
      end
    end
  end
end
