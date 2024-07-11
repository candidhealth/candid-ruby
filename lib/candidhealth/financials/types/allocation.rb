# frozen_string_literal: true

require_relative "allocation_target"
require "ostruct"
require "json"

module CandidApiClient
  module Financials
    module Types
      class Allocation
        # @return [Integer]
        attr_reader :amount_cents
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        attr_reader :target
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param amount_cents [Integer]
        # @param target [CandidApiClient::Financials::Types::AllocationTarget]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Financials::Types::Allocation]
        def initialize(amount_cents:, target:, additional_properties: nil)
          @amount_cents = amount_cents
          @target = target
          @additional_properties = additional_properties
          @_field_set = { "amount_cents": amount_cents, "target": target }
        end

        # Deserialize a JSON object to an instance of Allocation
        #
        # @param json_object [String]
        # @return [CandidApiClient::Financials::Types::Allocation]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          amount_cents = struct["amount_cents"]
          if parsed_json["target"].nil?
            target = nil
          else
            target = parsed_json["target"].to_json
            target = CandidApiClient::Financials::Types::AllocationTarget.from_json(json_object: target)
          end
          new(
            amount_cents: amount_cents,
            target: target,
            additional_properties: struct
          )
        end

        # Serialize an instance of Allocation to a JSON object
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
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          CandidApiClient::Financials::Types::AllocationTarget.validate_raw(obj: obj.target)
        end
      end
    end
  end
end
