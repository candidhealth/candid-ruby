# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class InsuranceAdjustmentInfo
          # @return [Integer] The total amount of insurance adjustments in cents for the service line.
          attr_reader :total_adjustment_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param total_adjustment_cents [Integer] The total amount of insurance adjustments in cents for the service line.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo]
          def initialize(total_adjustment_cents:, additional_properties: nil)
            @total_adjustment_cents = total_adjustment_cents
            @additional_properties = additional_properties
            @_field_set = { "total_adjustment_cents": total_adjustment_cents }
          end

          # Deserialize a JSON object to an instance of InsuranceAdjustmentInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            total_adjustment_cents = struct["total_adjustment_cents"]
            new(total_adjustment_cents: total_adjustment_cents, additional_properties: struct)
          end

          # Serialize an instance of InsuranceAdjustmentInfo to a JSON object
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
            obj.total_adjustment_cents.is_a?(Integer) != false || raise("Passed value for field obj.total_adjustment_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
