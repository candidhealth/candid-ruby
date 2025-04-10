# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureBundleSummary
          # @return [Integer] The count of charge captures which are not bundled.
          attr_reader :charge_capture_unbundled_count
          # @return [Integer] The count of charge capture bundles that are in an error state.
          attr_reader :charge_capture_bundles_in_error_count
          # @return [Integer] The number of ChargeCapturePostBilledChange items that are unresolved.
          attr_reader :charge_capture_unresolved_change_count
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param charge_capture_unbundled_count [Integer] The count of charge captures which are not bundled.
          # @param charge_capture_bundles_in_error_count [Integer] The count of charge capture bundles that are in an error state.
          # @param charge_capture_unresolved_change_count [Integer] The number of ChargeCapturePostBilledChange items that are unresolved.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary]
          def initialize(charge_capture_unbundled_count:, charge_capture_bundles_in_error_count:,
                         charge_capture_unresolved_change_count:, additional_properties: nil)
            @charge_capture_unbundled_count = charge_capture_unbundled_count
            @charge_capture_bundles_in_error_count = charge_capture_bundles_in_error_count
            @charge_capture_unresolved_change_count = charge_capture_unresolved_change_count
            @additional_properties = additional_properties
            @_field_set = {
              "charge_capture_unbundled_count": charge_capture_unbundled_count,
              "charge_capture_bundles_in_error_count": charge_capture_bundles_in_error_count,
              "charge_capture_unresolved_change_count": charge_capture_unresolved_change_count
            }
          end

          # Deserialize a JSON object to an instance of ChargeCaptureBundleSummary
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleSummary]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            charge_capture_unbundled_count = struct["charge_capture_unbundled_count"]
            charge_capture_bundles_in_error_count = struct["charge_capture_bundles_in_error_count"]
            charge_capture_unresolved_change_count = struct["charge_capture_unresolved_change_count"]
            new(
              charge_capture_unbundled_count: charge_capture_unbundled_count,
              charge_capture_bundles_in_error_count: charge_capture_bundles_in_error_count,
              charge_capture_unresolved_change_count: charge_capture_unresolved_change_count,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCaptureBundleSummary to a JSON object
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
            obj.charge_capture_unbundled_count.is_a?(Integer) != false || raise("Passed value for field obj.charge_capture_unbundled_count is not the expected type, validation failed.")
            obj.charge_capture_bundles_in_error_count.is_a?(Integer) != false || raise("Passed value for field obj.charge_capture_bundles_in_error_count is not the expected type, validation failed.")
            obj.charge_capture_unresolved_change_count.is_a?(Integer) != false || raise("Passed value for field obj.charge_capture_unresolved_change_count is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
