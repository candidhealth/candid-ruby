# frozen_string_literal: true

require "date"
require_relative "patient_ar_status"
require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class InventoryRecord
          # @return [String]
          attr_reader :claim_id
          # @return [String]
          attr_reader :encounter_id
          # @return [DateTime]
          attr_reader :timestamp
          # @return [String]
          attr_reader :patient_external_id
          # @return [CandidApiClient::PatientAr::V1::Types::PatientArStatus]
          attr_reader :patient_ar_status
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_id [String]
          # @param encounter_id [String]
          # @param timestamp [DateTime]
          # @param patient_external_id [String]
          # @param patient_ar_status [CandidApiClient::PatientAr::V1::Types::PatientArStatus]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::InventoryRecord]
          def initialize(claim_id:, encounter_id:, timestamp:, patient_external_id:, patient_ar_status:,
                         additional_properties: nil)
            @claim_id = claim_id
            @encounter_id = encounter_id
            @timestamp = timestamp
            @patient_external_id = patient_external_id
            @patient_ar_status = patient_ar_status
            @additional_properties = additional_properties
            @_field_set = {
              "claim_id": claim_id,
              "encounter_id": encounter_id,
              "timestamp": timestamp,
              "patient_external_id": patient_external_id,
              "patient_ar_status": patient_ar_status
            }
          end

          # Deserialize a JSON object to an instance of InventoryRecord
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::InventoryRecord]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            claim_id = struct["claim_id"]
            encounter_id = struct["encounter_id"]
            timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
            patient_external_id = struct["patient_external_id"]
            patient_ar_status = struct["patient_ar_status"]
            new(
              claim_id: claim_id,
              encounter_id: encounter_id,
              timestamp: timestamp,
              patient_external_id: patient_external_id,
              patient_ar_status: patient_ar_status,
              additional_properties: struct
            )
          end

          # Serialize an instance of InventoryRecord to a JSON object
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
            obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
            obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.patient_ar_status.is_a?(CandidApiClient::PatientAr::V1::Types::PatientArStatus) != false || raise("Passed value for field obj.patient_ar_status is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
