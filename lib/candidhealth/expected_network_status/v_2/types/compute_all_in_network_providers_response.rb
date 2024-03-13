# frozen_string_literal: true

require_relative "compute_all_in_network_rendering_providers_result"
require_relative "network_status_check_id"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ComputeAllInNetworkProvidersResponse
        attr_reader :computed_network_status, :network_status_check_id, :additional_properties

        # @param computed_network_status [ExpectedNetworkStatus::V2::ComputeAllInNetworkRenderingProvidersResult]
        # @param network_status_check_id [ExpectedNetworkStatus::V2::NETWORK_STATUS_CHECK_ID] Unique network status check ID for this request
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse]
        def initialize(computed_network_status:, network_status_check_id:, additional_properties: nil)
          # @type [ExpectedNetworkStatus::V2::ComputeAllInNetworkRenderingProvidersResult]
          @computed_network_status = computed_network_status
          # @type [ExpectedNetworkStatus::V2::NETWORK_STATUS_CHECK_ID] Unique network status check ID for this request
          @network_status_check_id = network_status_check_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ComputeAllInNetworkProvidersResponse
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["computed_network_status"].nil?
            computed_network_status = nil
          else
            computed_network_status = parsed_json["computed_network_status"].to_json
            computed_network_status = ExpectedNetworkStatus::V2::ComputeAllInNetworkRenderingProvidersResult.from_json(json_object: computed_network_status)
          end
          network_status_check_id = struct.network_status_check_id
          new(computed_network_status: computed_network_status, network_status_check_id: network_status_check_id,
              additional_properties: struct)
        end

        # Serialize an instance of ComputeAllInNetworkProvidersResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "computed_network_status": @computed_network_status,
            "network_status_check_id": @network_status_check_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          ExpectedNetworkStatus::V2::ComputeAllInNetworkRenderingProvidersResult.validate_raw(obj: obj.computed_network_status)
          obj.network_status_check_id.is_a?(String) != false || raise("Passed value for field obj.network_status_check_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
