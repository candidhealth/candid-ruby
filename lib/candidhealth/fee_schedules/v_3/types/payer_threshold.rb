# frozen_string_literal: true

require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Rate thresholds that determine fee schedule rate matching behavior. When a service line is adjudicated by a payer Candid determines if the payer's allowed amount "matches" the rate value. If the allowed amount doesn't equal the rate value, Candid moves the claim to a PAID_INCORRECTLY state. These optional thresholds allow a user to set wiggle room to avoid claims moving to PAID_INCORRECTLY and instead have them move directly to FINALIZED_PAID when the payer's allowed amount is greater than [rate_cents - lower_threshold_cents] and less than [rate_cents + upper_threshold_cents].\n Additionally, a client can set disable_paid_incorrectly to avoid the PAID_INCORRECTLY claim status entirely.
      class PayerThreshold
        attr_reader :upper_threshold_cents, :lower_threshold_cents, :disable_paid_incorrectly, :additional_properties

        # @param upper_threshold_cents [Integer]
        # @param lower_threshold_cents [Integer]
        # @param disable_paid_incorrectly [Boolean]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::PayerThreshold]
        def initialize(disable_paid_incorrectly:, upper_threshold_cents: nil, lower_threshold_cents: nil,
                       additional_properties: nil)
          # @type [Integer]
          @upper_threshold_cents = upper_threshold_cents
          # @type [Integer]
          @lower_threshold_cents = lower_threshold_cents
          # @type [Boolean]
          @disable_paid_incorrectly = disable_paid_incorrectly
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PayerThreshold
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::PayerThreshold]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          upper_threshold_cents = struct.upper_threshold_cents
          lower_threshold_cents = struct.lower_threshold_cents
          disable_paid_incorrectly = struct.disable_paid_incorrectly
          new(upper_threshold_cents: upper_threshold_cents, lower_threshold_cents: lower_threshold_cents,
              disable_paid_incorrectly: disable_paid_incorrectly, additional_properties: struct)
        end

        # Serialize an instance of PayerThreshold to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "upper_threshold_cents": @upper_threshold_cents,
            "lower_threshold_cents": @lower_threshold_cents,
            "disable_paid_incorrectly": @disable_paid_incorrectly
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.upper_threshold_cents&.is_a?(Integer) != false || raise("Passed value for field obj.upper_threshold_cents is not the expected type, validation failed.")
          obj.lower_threshold_cents&.is_a?(Integer) != false || raise("Passed value for field obj.lower_threshold_cents is not the expected type, validation failed.")
          obj.disable_paid_incorrectly.is_a?(Boolean) != false || raise("Passed value for field obj.disable_paid_incorrectly is not the expected type, validation failed.")
        end
      end
    end
  end
end
