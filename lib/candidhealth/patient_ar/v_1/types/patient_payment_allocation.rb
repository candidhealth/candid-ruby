# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class PatientPaymentAllocation
          # @return [String] Payment identifier from the source system (e.g., patient portal, manual entry).
          #  Note multiple allocations may exist for a single payment and
          #  thus may share the same source_id.
          attr_reader :source_id
          # @return [Integer] The amount of the patient payment in cents.
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param source_id [String] Payment identifier from the source system (e.g., patient portal, manual entry).
          #  Note multiple allocations may exist for a single payment and
          #  thus may share the same source_id.
          # @param amount_cents [Integer] The amount of the patient payment in cents.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentAllocation]
          def initialize(amount_cents:, source_id: OMIT, additional_properties: nil)
            @source_id = source_id if source_id != OMIT
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = { "source_id": source_id, "amount_cents": amount_cents }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientPaymentAllocation
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentAllocation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            source_id = struct["source_id"]
            amount_cents = struct["amount_cents"]
            new(
              source_id: source_id,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientPaymentAllocation to a JSON object
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
            obj.source_id&.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
