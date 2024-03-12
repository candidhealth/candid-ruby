# frozen_string_literal: true

require_relative "write_off_id"
require "date"
require_relative "patient_write_off_reason"
require_relative "../../../commons/types/service_line_id"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      class PatientWriteOff
        attr_reader :write_off_id, :write_off_timestamp, :write_off_note, :write_off_reason, :service_line_id,
                    :reverts_write_off_id, :reverted_by_write_off_id, :amount_cents, :additional_properties

        # @param write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param write_off_timestamp [DateTime]
        # @param write_off_note [String]
        # @param write_off_reason [WriteOffs::V1::PatientWriteOffReason]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param reverts_write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param reverted_by_write_off_id [WriteOffs::V1::WRITE_OFF_ID]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [WriteOffs::V1::PatientWriteOff]
        def initialize(write_off_id:, write_off_timestamp:, write_off_reason:, service_line_id:, amount_cents:, write_off_note: nil,
                       reverts_write_off_id: nil, reverted_by_write_off_id: nil, additional_properties: nil)
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @write_off_id = write_off_id
          # @type [DateTime]
          @write_off_timestamp = write_off_timestamp
          # @type [String]
          @write_off_note = write_off_note
          # @type [WriteOffs::V1::PatientWriteOffReason]
          @write_off_reason = write_off_reason
          # @type [Commons::SERVICE_LINE_ID]
          @service_line_id = service_line_id
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @reverts_write_off_id = reverts_write_off_id
          # @type [WriteOffs::V1::WRITE_OFF_ID]
          @reverted_by_write_off_id = reverted_by_write_off_id
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientWriteOff
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::PatientWriteOff]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          write_off_id = struct.write_off_id
          write_off_timestamp = unless parsed_json["write_off_timestamp"].nil?
                                  DateTime.parse(parsed_json["write_off_timestamp"])
                                end
          write_off_note = struct.write_off_note
          write_off_reason = struct.write_off_reason
          service_line_id = struct.service_line_id
          reverts_write_off_id = struct.reverts_write_off_id
          reverted_by_write_off_id = struct.reverted_by_write_off_id
          amount_cents = struct.amount_cents
          new(write_off_id: write_off_id, write_off_timestamp: write_off_timestamp, write_off_note: write_off_note,
              write_off_reason: write_off_reason, service_line_id: service_line_id, reverts_write_off_id: reverts_write_off_id, reverted_by_write_off_id: reverted_by_write_off_id, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of PatientWriteOff to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "write_off_id": @write_off_id,
            "write_off_timestamp": @write_off_timestamp,
            "write_off_note": @write_off_note,
            "write_off_reason": @write_off_reason,
            "service_line_id": @service_line_id,
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
          obj.write_off_id.is_a?(UUID) != false || raise("Passed value for field obj.write_off_id is not the expected type, validation failed.")
          obj.write_off_timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.write_off_timestamp is not the expected type, validation failed.")
          obj.write_off_note&.is_a?(String) != false || raise("Passed value for field obj.write_off_note is not the expected type, validation failed.")
          obj.write_off_reason.is_a?(WriteOffs::V1::PatientWriteOffReason) != false || raise("Passed value for field obj.write_off_reason is not the expected type, validation failed.")
          obj.service_line_id.is_a?(UUID) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
          obj.reverts_write_off_id&.is_a?(UUID) != false || raise("Passed value for field obj.reverts_write_off_id is not the expected type, validation failed.")
          obj.reverted_by_write_off_id&.is_a?(UUID) != false || raise("Passed value for field obj.reverted_by_write_off_id is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
