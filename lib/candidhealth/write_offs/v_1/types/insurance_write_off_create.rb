# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_identifier"
require_relative "insurance_write_off_target"
require "date"
require_relative "insurance_write_off_reason"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      class InsuranceWriteOffCreate
        attr_reader :payer_identifier, :write_off_target, :write_off_timestamp, :write_off_note, :write_off_reason,
                    :amount_cents, :additional_properties

        # @param payer_identifier [Payers::V3::PayerIdentifier]
        # @param write_off_target [WriteOffs::V1::InsuranceWriteOffTarget]
        # @param write_off_timestamp [DateTime]
        # @param write_off_note [String]
        # @param write_off_reason [WriteOffs::V1::InsuranceWriteOffReason]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [WriteOffs::V1::InsuranceWriteOffCreate]
        def initialize(payer_identifier:, write_off_target:, write_off_timestamp:, write_off_reason:, amount_cents:,
                       write_off_note: nil, additional_properties: nil)
          # @type [Payers::V3::PayerIdentifier]
          @payer_identifier = payer_identifier
          # @type [WriteOffs::V1::InsuranceWriteOffTarget]
          @write_off_target = write_off_target
          # @type [DateTime]
          @write_off_timestamp = write_off_timestamp
          # @type [String]
          @write_off_note = write_off_note
          # @type [WriteOffs::V1::InsuranceWriteOffReason]
          @write_off_reason = write_off_reason
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceWriteOffCreate
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::InsuranceWriteOffCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["payer_identifier"].nil?
            payer_identifier = nil
          else
            payer_identifier = parsed_json["payer_identifier"].to_json
            payer_identifier = Payers::V3::PayerIdentifier.from_json(json_object: payer_identifier)
          end
          if parsed_json["write_off_target"].nil?
            write_off_target = nil
          else
            write_off_target = parsed_json["write_off_target"].to_json
            write_off_target = WriteOffs::V1::InsuranceWriteOffTarget.from_json(json_object: write_off_target)
          end
          write_off_timestamp = unless parsed_json["write_off_timestamp"].nil?
                                  DateTime.parse(parsed_json["write_off_timestamp"])
                                end
          write_off_note = struct.write_off_note
          write_off_reason = struct.write_off_reason
          amount_cents = struct.amount_cents
          new(payer_identifier: payer_identifier, write_off_target: write_off_target,
              write_off_timestamp: write_off_timestamp, write_off_note: write_off_note, write_off_reason: write_off_reason, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of InsuranceWriteOffCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer_identifier": @payer_identifier,
            "write_off_target": @write_off_target,
            "write_off_timestamp": @write_off_timestamp,
            "write_off_note": @write_off_note,
            "write_off_reason": @write_off_reason,
            "amount_cents": @amount_cents
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          Payers::V3::PayerIdentifier.validate_raw(obj: obj.payer_identifier)
          WriteOffs::V1::InsuranceWriteOffTarget.validate_raw(obj: obj.write_off_target)
          obj.write_off_timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.write_off_timestamp is not the expected type, validation failed.")
          obj.write_off_note&.is_a?(String) != false || raise("Passed value for field obj.write_off_note is not the expected type, validation failed.")
          obj.write_off_reason.is_a?(WriteOffs::V1::InsuranceWriteOffReason) != false || raise("Passed value for field obj.write_off_reason is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
