# frozen_string_literal: true

require "date"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      class ServiceLineAdjustment
        attr_reader :created_at, :adjustment_group_code, :adjustment_reason_code, :adjustment_amount_cents,
                    :adjustment_note, :additional_properties

        # @param created_at [DateTime]
        # @param adjustment_group_code [String]
        # @param adjustment_reason_code [String]
        # @param adjustment_amount_cents [Integer]
        # @param adjustment_note [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::ServiceLineAdjustment]
        def initialize(created_at:, adjustment_group_code: nil, adjustment_reason_code: nil,
                       adjustment_amount_cents: nil, adjustment_note: nil, additional_properties: nil)
          # @type [DateTime]
          @created_at = created_at
          # @type [String]
          @adjustment_group_code = adjustment_group_code
          # @type [String]
          @adjustment_reason_code = adjustment_reason_code
          # @type [Integer]
          @adjustment_amount_cents = adjustment_amount_cents
          # @type [String]
          @adjustment_note = adjustment_note
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLineAdjustment
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::ServiceLineAdjustment]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          adjustment_group_code = struct.adjustment_group_code
          adjustment_reason_code = struct.adjustment_reason_code
          adjustment_amount_cents = struct.adjustment_amount_cents
          adjustment_note = struct.adjustment_note
          new(created_at: created_at, adjustment_group_code: adjustment_group_code,
              adjustment_reason_code: adjustment_reason_code, adjustment_amount_cents: adjustment_amount_cents, adjustment_note: adjustment_note, additional_properties: struct)
        end

        # Serialize an instance of ServiceLineAdjustment to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "created_at": @created_at,
            "adjustment_group_code": @adjustment_group_code,
            "adjustment_reason_code": @adjustment_reason_code,
            "adjustment_amount_cents": @adjustment_amount_cents,
            "adjustment_note": @adjustment_note
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.adjustment_group_code&.is_a?(String) != false || raise("Passed value for field obj.adjustment_group_code is not the expected type, validation failed.")
          obj.adjustment_reason_code&.is_a?(String) != false || raise("Passed value for field obj.adjustment_reason_code is not the expected type, validation failed.")
          obj.adjustment_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.adjustment_amount_cents is not the expected type, validation failed.")
          obj.adjustment_note&.is_a?(String) != false || raise("Passed value for field obj.adjustment_note is not the expected type, validation failed.")
        end
      end
    end
  end
end
