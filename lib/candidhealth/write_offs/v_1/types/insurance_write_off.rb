# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer"
require_relative "insurance_write_off_target"
require "date"
require_relative "insurance_write_off_reason"
require "ostruct"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      module Types
        class InsuranceWriteOff
          # @return [String]
          attr_reader :write_off_id
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          attr_reader :payer
          # @return [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffTarget]
          attr_reader :write_off_target
          # @return [DateTime]
          attr_reader :write_off_timestamp
          # @return [String]
          attr_reader :write_off_note
          # @return [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffReason]
          attr_reader :write_off_reason
          # @return [String]
          attr_reader :reverts_write_off_id
          # @return [String]
          attr_reader :reverted_by_write_off_id
          # @return [Integer]
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param write_off_id [String]
          # @param payer [CandidApiClient::Payers::V3::Types::Payer]
          # @param write_off_target [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffTarget]
          # @param write_off_timestamp [DateTime]
          # @param write_off_note [String]
          # @param write_off_reason [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffReason]
          # @param reverts_write_off_id [String]
          # @param reverted_by_write_off_id [String]
          # @param amount_cents [Integer]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOff]
          def initialize(write_off_id:, payer:, write_off_target:, write_off_timestamp:, write_off_reason:,
                         amount_cents:, write_off_note: OMIT, reverts_write_off_id: OMIT, reverted_by_write_off_id: OMIT, additional_properties: nil)
            @write_off_id = write_off_id
            @payer = payer
            @write_off_target = write_off_target
            @write_off_timestamp = write_off_timestamp
            @write_off_note = write_off_note if write_off_note != OMIT
            @write_off_reason = write_off_reason
            @reverts_write_off_id = reverts_write_off_id if reverts_write_off_id != OMIT
            @reverted_by_write_off_id = reverted_by_write_off_id if reverted_by_write_off_id != OMIT
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = {
              "write_off_id": write_off_id,
              "payer": payer,
              "write_off_target": write_off_target,
              "write_off_timestamp": write_off_timestamp,
              "write_off_note": write_off_note,
              "write_off_reason": write_off_reason,
              "reverts_write_off_id": reverts_write_off_id,
              "reverted_by_write_off_id": reverted_by_write_off_id,
              "amount_cents": amount_cents
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceWriteOff
          #
          # @param json_object [String]
          # @return [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOff]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            write_off_id = struct["write_off_id"]
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: payer)
            end
            if parsed_json["write_off_target"].nil?
              write_off_target = nil
            else
              write_off_target = parsed_json["write_off_target"].to_json
              write_off_target = CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffTarget.from_json(json_object: write_off_target)
            end
            write_off_timestamp = unless parsed_json["write_off_timestamp"].nil?
                                    DateTime.parse(parsed_json["write_off_timestamp"])
                                  end
            write_off_note = struct["write_off_note"]
            write_off_reason = struct["write_off_reason"]
            reverts_write_off_id = struct["reverts_write_off_id"]
            reverted_by_write_off_id = struct["reverted_by_write_off_id"]
            amount_cents = struct["amount_cents"]
            new(
              write_off_id: write_off_id,
              payer: payer,
              write_off_target: write_off_target,
              write_off_timestamp: write_off_timestamp,
              write_off_note: write_off_note,
              write_off_reason: write_off_reason,
              reverts_write_off_id: reverts_write_off_id,
              reverted_by_write_off_id: reverted_by_write_off_id,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceWriteOff to a JSON object
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
            obj.write_off_id.is_a?(String) != false || raise("Passed value for field obj.write_off_id is not the expected type, validation failed.")
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffTarget.validate_raw(obj: obj.write_off_target)
            obj.write_off_timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.write_off_timestamp is not the expected type, validation failed.")
            obj.write_off_note&.is_a?(String) != false || raise("Passed value for field obj.write_off_note is not the expected type, validation failed.")
            obj.write_off_reason.is_a?(CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffReason) != false || raise("Passed value for field obj.write_off_reason is not the expected type, validation failed.")
            obj.reverts_write_off_id&.is_a?(String) != false || raise("Passed value for field obj.reverts_write_off_id is not the expected type, validation failed.")
            obj.reverted_by_write_off_id&.is_a?(String) != false || raise("Passed value for field obj.reverted_by_write_off_id is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
