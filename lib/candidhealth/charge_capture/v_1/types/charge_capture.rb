# frozen_string_literal: true

require_relative "charge_capture_status"
require_relative "charge_capture_data"
require "date"
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
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :charge_external_id
          # @return [String]
          attr_reader :ehr_source_url
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          attr_reader :date_of_service
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus]
          # @param charge_capture_data [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData]
          # @param patient_external_id [String]
          # @param charge_external_id [String]
          # @param ehr_source_url [String]
          # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
          def initialize(id:, status:, charge_capture_data:, patient_external_id:, charge_external_id:,
                         ehr_source_url: OMIT, date_of_service: OMIT, additional_properties: nil)
            @id = id
            @status = status
            @charge_capture_data = charge_capture_data
            @patient_external_id = patient_external_id
            @charge_external_id = charge_external_id
            @ehr_source_url = ehr_source_url if ehr_source_url != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "status": status,
              "charge_capture_data": charge_capture_data,
              "patient_external_id": patient_external_id,
              "charge_external_id": charge_external_id,
              "ehr_source_url": ehr_source_url,
              "date_of_service": date_of_service
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
            patient_external_id = struct["patient_external_id"]
            charge_external_id = struct["charge_external_id"]
            ehr_source_url = struct["ehr_source_url"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            new(
              id: id,
              status: status,
              charge_capture_data: charge_capture_data,
              patient_external_id: patient_external_id,
              charge_external_id: charge_external_id,
              ehr_source_url: ehr_source_url,
              date_of_service: date_of_service,
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
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.charge_external_id.is_a?(String) != false || raise("Passed value for field obj.charge_external_id is not the expected type, validation failed.")
            obj.ehr_source_url&.is_a?(String) != false || raise("Passed value for field obj.ehr_source_url is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end