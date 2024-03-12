# frozen_string_literal: true

require_relative "allocation_target_create"
require "json"

module CandidApiClient
  class Financials
    # Allocations are portions of payments that are applied to specific resources, known as targets. Each allocation has
    # and amount, defined in cents, and a target.
    class AllocationCreate
      attr_reader :amount_cents, :target, :additional_properties

      # @param amount_cents [Integer]
      # @param target [Financials::AllocationTargetCreate]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Financials::AllocationCreate]
      def initialize(amount_cents:, target:, additional_properties: nil)
        # @type [Integer]
        @amount_cents = amount_cents
        # @type [Financials::AllocationTargetCreate]
        @target = target
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AllocationCreate
      #
      # @param json_object [JSON]
      # @return [Financials::AllocationCreate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        amount_cents = struct.amount_cents
        if parsed_json["target"].nil?
          target = nil
        else
          target = parsed_json["target"].to_json
          target = Financials::AllocationTargetCreate.from_json(json_object: target)
        end
        new(amount_cents: amount_cents, target: target, additional_properties: struct)
      end

      # Serialize an instance of AllocationCreate to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "amount_cents": @amount_cents, "target": @target }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        Financials::AllocationTargetCreate.validate_raw(obj: obj.target)
      end
    end
  end
end
