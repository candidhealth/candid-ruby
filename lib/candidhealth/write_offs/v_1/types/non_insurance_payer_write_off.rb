# frozen_string_literal: true

require_relative "../../../non_insurance_payers/v_1/types/non_insurance_payer"
require "date"
require_relative "insurance_write_off_reason"
require "ostruct"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      module Types
        class NonInsurancePayerWriteOff
          # @return [String]
          attr_reader :write_off_id
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          attr_reader :non_insurance_payer
          # @return [String]
          attr_reader :service_line_id
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
          # @param non_insurance_payer [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          # @param service_line_id [String]
          # @param write_off_timestamp [DateTime]
          # @param write_off_note [String]
          # @param write_off_reason [CandidApiClient::WriteOffs::V1::Types::InsuranceWriteOffReason]
          # @param reverts_write_off_id [String]
          # @param reverted_by_write_off_id [String]
          # @param amount_cents [Integer]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::WriteOffs::V1::Types::NonInsurancePayerWriteOff]
          def initialize(write_off_id:, non_insurance_payer:, service_line_id:, write_off_timestamp:, write_off_reason:, amount_cents:,
                         write_off_note: OMIT, reverts_write_off_id: OMIT, reverted_by_write_off_id: OMIT, additional_properties: nil)
            @write_off_id = write_off_id
            @non_insurance_payer = non_insurance_payer
            @service_line_id = service_line_id
            @write_off_timestamp = write_off_timestamp
            @write_off_note = write_off_note if write_off_note != OMIT
            @write_off_reason = write_off_reason
            @reverts_write_off_id = reverts_write_off_id if reverts_write_off_id != OMIT
            @reverted_by_write_off_id = reverted_by_write_off_id if reverted_by_write_off_id != OMIT
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = {
              "write_off_id": write_off_id,
              "non_insurance_payer": non_insurance_payer,
              "service_line_id": service_line_id,
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

          # Deserialize a JSON object to an instance of NonInsurancePayerWriteOff
          #
          # @param json_object [String]
          # @return [CandidApiClient::WriteOffs::V1::Types::NonInsurancePayerWriteOff]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            write_off_id = struct["write_off_id"]
            if parsed_json["non_insurance_payer"].nil?
              non_insurance_payer = nil
            else
              non_insurance_payer = parsed_json["non_insurance_payer"].to_json
              non_insurance_payer = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: non_insurance_payer)
            end
            service_line_id = struct["service_line_id"]
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
              non_insurance_payer: non_insurance_payer,
              service_line_id: service_line_id,
              write_off_timestamp: write_off_timestamp,
              write_off_note: write_off_note,
              write_off_reason: write_off_reason,
              reverts_write_off_id: reverts_write_off_id,
              reverted_by_write_off_id: reverted_by_write_off_id,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerWriteOff to a JSON object
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
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.validate_raw(obj: obj.non_insurance_payer)
            obj.service_line_id.is_a?(String) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
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
