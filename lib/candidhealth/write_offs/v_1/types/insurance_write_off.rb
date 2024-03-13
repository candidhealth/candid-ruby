# frozen_string_literal: true

require_relative "write_off_id"
require_relative "../../../payers/v_3/types/payer"
require_relative "insurance_write_off_target"
require "date"
require_relative "insurance_write_off_reason"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      class InsuranceWriteOff
        attr_reader :write_off_id, :payer, :write_off_target, :write_off_timestamp, :write_off_note, :write_off_reason,
                    :reverts_write_off_id, :reverted_by_write_off_id, :amount_cents, :additional_properties

        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param payer [Payers::V3::Payer]
        # @param write_off_target [WriteOffs::V1::InsuranceWriteOffTarget]
        # @param write_off_timestamp [DateTime]
        # @param write_off_note [String]
        # @param write_off_reason [WriteOffs::V1::InsuranceWriteOffReason]
        # @param reverts_write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param reverted_by_write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [WriteOffs::V1::InsuranceWriteOff]
        def initialize(write_off_id:, payer:, write_off_target:, write_off_timestamp:, write_off_reason:,
                       amount_cents:, write_off_note: nil, reverts_write_off_id: nil, reverted_by_write_off_id: nil, additional_properties: nil)
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @write_off_id = write_off_id
          # @type [Payers::V3::Payer]
          @payer = payer
          # @type [WriteOffs::V1::InsuranceWriteOffTarget]
          @write_off_target = write_off_target
          # @type [DateTime]
          @write_off_timestamp = write_off_timestamp
          # @type [String]
          @write_off_note = write_off_note
          # @type [WriteOffs::V1::InsuranceWriteOffReason]
          @write_off_reason = write_off_reason
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @reverts_write_off_id = reverts_write_off_id
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @reverted_by_write_off_id = reverted_by_write_off_id
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceWriteOff
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::InsuranceWriteOff]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          write_off_id = struct.write_off_id
          if parsed_json["payer"].nil?
            payer = nil
          else
            payer = parsed_json["payer"].to_json
            payer = Payers::V3::Payer.from_json(json_object: payer)
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
          reverts_write_off_id = struct.reverts_write_off_id
          reverted_by_write_off_id = struct.reverted_by_write_off_id
          amount_cents = struct.amount_cents
          new(write_off_id: write_off_id, payer: payer, write_off_target: write_off_target,
              write_off_timestamp: write_off_timestamp, write_off_note: write_off_note, write_off_reason: write_off_reason, reverts_write_off_id: reverts_write_off_id, reverted_by_write_off_id: reverted_by_write_off_id, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of InsuranceWriteOff to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "write_off_id": @write_off_id,
            "payer": @payer,
            "write_off_target": @write_off_target,
            "write_off_timestamp": @write_off_timestamp,
            "write_off_note": @write_off_note,
            "write_off_reason": @write_off_reason,
            "reverts_write_off_id": @reverts_write_off_id,
            "reverted_by_write_off_id": @reverted_by_write_off_id,
            "amount_cents": @amount_cents
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.write_off_id.is_a?(String) != false || raise("Passed value for field obj.write_off_id is not the expected type, validation failed.")
          Payers::V3::Payer.validate_raw(obj: obj.payer)
          WriteOffs::V1::InsuranceWriteOffTarget.validate_raw(obj: obj.write_off_target)
          obj.write_off_timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.write_off_timestamp is not the expected type, validation failed.")
          obj.write_off_note&.is_a?(String) != false || raise("Passed value for field obj.write_off_note is not the expected type, validation failed.")
          obj.write_off_reason.is_a?(WriteOffs::V1::InsuranceWriteOffReason) != false || raise("Passed value for field obj.write_off_reason is not the expected type, validation failed.")
          obj.reverts_write_off_id&.is_a?(String) != false || raise("Passed value for field obj.reverts_write_off_id is not the expected type, validation failed.")
          obj.reverted_by_write_off_id&.is_a?(String) != false || raise("Passed value for field obj.reverted_by_write_off_id is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
