# frozen_string_literal: true

require_relative "compute_all_in_network_rendering_providers_result"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class ComputeAllInNetworkProvidersResponse
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkRenderingProvidersResult]
          attr_reader :computed_network_status
          # @return [String] Unique network status check ID for this request
          attr_reader :network_status_check_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param computed_network_status [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkRenderingProvidersResult]
          # @param network_status_check_id [String] Unique network status check ID for this request
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
          def initialize(computed_network_status:, network_status_check_id:, additional_properties: nil)
            @computed_network_status = computed_network_status
            @network_status_check_id = network_status_check_id
            @additional_properties = additional_properties
            @_field_set = {
              "computed_network_status": computed_network_status,
              "network_status_check_id": network_status_check_id
            }
          end

          # Deserialize a JSON object to an instance of ComputeAllInNetworkProvidersResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["computed_network_status"].nil?
              computed_network_status = nil
            else
              computed_network_status = parsed_json["computed_network_status"].to_json
              computed_network_status = CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkRenderingProvidersResult.from_json(json_object: computed_network_status)
            end
            network_status_check_id = struct["network_status_check_id"]
            new(
              computed_network_status: computed_network_status,
              network_status_check_id: network_status_check_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ComputeAllInNetworkProvidersResponse to a JSON object
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
            CandidApiClient::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkRenderingProvidersResult.validate_raw(obj: obj.computed_network_status)
            obj.network_status_check_id.is_a?(String) != false || raise("Passed value for field obj.network_status_check_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
