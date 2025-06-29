# frozen_string_literal: true

require_relative "charge_capture_status"
require_relative "charge_capture_data"
require "date"
require_relative "charge_capture_error"
require_relative "charge_capture_post_billed_change"
require "ostruct"
require "json"

module CandidApiClient
  module ChargeCapture
    module V1
      module Types
        class ChargeCapture
          # @return [String]
          attr_reader :id
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus]
          attr_reader :status
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData]
          attr_reader :charge_capture_data
          # @return [Date]
          attr_reader :date_of_service
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :charge_external_id
          # @return [String]
          attr_reader :ehr_source_url
          # @return [String]
          attr_reader :originating_system
          # @return [String]
          attr_reader :claim_creation_category
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError]
          attr_reader :error
          # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange>]
          attr_reader :updates
          # @return [String]
          attr_reader :claim_creation_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus]
          # @param charge_capture_data [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData]
          # @param date_of_service [Date]
          # @param patient_external_id [String]
          # @param charge_external_id [String]
          # @param ehr_source_url [String]
          # @param originating_system [String]
          # @param claim_creation_category [String]
          # @param error [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError]
          # @param updates [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange>]
          # @param claim_creation_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
          def initialize(id:, status:, charge_capture_data:, patient_external_id:, charge_external_id:, updates:,
                         date_of_service: OMIT, ehr_source_url: OMIT, originating_system: OMIT, claim_creation_category: OMIT, error: OMIT, claim_creation_id: OMIT, additional_properties: nil)
            @id = id
            @status = status
            @charge_capture_data = charge_capture_data
            @date_of_service = date_of_service if date_of_service != OMIT
            @patient_external_id = patient_external_id
            @charge_external_id = charge_external_id
            @ehr_source_url = ehr_source_url if ehr_source_url != OMIT
            @originating_system = originating_system if originating_system != OMIT
            @claim_creation_category = claim_creation_category if claim_creation_category != OMIT
            @error = error if error != OMIT
            @updates = updates
            @claim_creation_id = claim_creation_id if claim_creation_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "status": status,
              "charge_capture_data": charge_capture_data,
              "date_of_service": date_of_service,
              "patient_external_id": patient_external_id,
              "charge_external_id": charge_external_id,
              "ehr_source_url": ehr_source_url,
              "originating_system": originating_system,
              "claim_creation_category": claim_creation_category,
              "error": error,
              "updates": updates,
              "claim_creation_id": claim_creation_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ChargeCapture
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            status = struct["status"]
            if parsed_json["charge_capture_data"].nil?
              charge_capture_data = nil
            else
              charge_capture_data = parsed_json["charge_capture_data"].to_json
              charge_capture_data = CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData.from_json(json_object: charge_capture_data)
            end
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            patient_external_id = struct["patient_external_id"]
            charge_external_id = struct["charge_external_id"]
            ehr_source_url = struct["ehr_source_url"]
            originating_system = struct["originating_system"]
            claim_creation_category = struct["claim_creation_category"]
            if parsed_json["error"].nil?
              error = nil
            else
              error = parsed_json["error"].to_json
              error = CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError.from_json(json_object: error)
            end
            updates = parsed_json["updates"]&.map do |item|
              item = item.to_json
              CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange.from_json(json_object: item)
            end
            claim_creation_id = struct["claim_creation_id"]
            new(
              id: id,
              status: status,
              charge_capture_data: charge_capture_data,
              date_of_service: date_of_service,
              patient_external_id: patient_external_id,
              charge_external_id: charge_external_id,
              ehr_source_url: ehr_source_url,
              originating_system: originating_system,
              claim_creation_category: claim_creation_category,
              error: error,
              updates: updates,
              claim_creation_id: claim_creation_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCapture to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData.validate_raw(obj: obj.charge_capture_data)
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.charge_external_id.is_a?(String) != false || raise("Passed value for field obj.charge_external_id is not the expected type, validation failed.")
            obj.ehr_source_url&.is_a?(String) != false || raise("Passed value for field obj.ehr_source_url is not the expected type, validation failed.")
            obj.originating_system&.is_a?(String) != false || raise("Passed value for field obj.originating_system is not the expected type, validation failed.")
            obj.claim_creation_category&.is_a?(String) != false || raise("Passed value for field obj.claim_creation_category is not the expected type, validation failed.")
            obj.error.nil? || CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError.validate_raw(obj: obj.error)
            obj.updates.is_a?(Array) != false || raise("Passed value for field obj.updates is not the expected type, validation failed.")
            obj.claim_creation_id&.is_a?(String) != false || raise("Passed value for field obj.claim_creation_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
