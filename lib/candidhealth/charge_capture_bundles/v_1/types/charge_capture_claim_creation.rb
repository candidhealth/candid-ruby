# frozen_string_literal: true

require_relative "charge_capture_claim_creation_status"
require_relative "../../../charge_capture/v_1/types/charge_capture_error"
require_relative "../../../charge_capture/v_1/types/charge_capture_data"
require "ostruct"
require "json"

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureClaimCreation
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :created_encounter_id
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus] Status of the Claim Creation, Successful means that the Claim Creation created a
          #  corresponding Claim
          attr_reader :status
          # @return [Hash{String => Object}] A dictionary of characteristics that are used to group charge captures together
          #  based on the bundling configuration.
          #  Example: {"service_facility.npi": "99999999", "date_of_service": "2023-01-01"}
          attr_reader :characteristics
          # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError>] All errors that were found when the Claim was attempted to be created.
          #  Errors can correspond to the Claim Creation as a whole or specific underlying
          #  Charge Captures.
          attr_reader :errors
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData] If a ChargeCaptureBundle attempts creation, this is the input that was created
          #  from the underlying charges and used to attempt encounter creation.
          attr_reader :encounter_creation_input
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param created_encounter_id [String]
          # @param status [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus] Status of the Claim Creation, Successful means that the Claim Creation created a
          #  corresponding Claim
          # @param characteristics [Hash{String => Object}] A dictionary of characteristics that are used to group charge captures together
          #  based on the bundling configuration.
          #  Example: {"service_facility.npi": "99999999", "date_of_service": "2023-01-01"}
          # @param errors [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError>] All errors that were found when the Claim was attempted to be created.
          #  Errors can correspond to the Claim Creation as a whole or specific underlying
          #  Charge Captures.
          # @param encounter_creation_input [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData] If a ChargeCaptureBundle attempts creation, this is the input that was created
          #  from the underlying charges and used to attempt encounter creation.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation]
          def initialize(id:, status:, characteristics:, errors:, created_encounter_id: OMIT,
                         encounter_creation_input: OMIT, additional_properties: nil)
            @id = id
            @created_encounter_id = created_encounter_id if created_encounter_id != OMIT
            @status = status
            @characteristics = characteristics
            @errors = errors
            @encounter_creation_input = encounter_creation_input if encounter_creation_input != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "created_encounter_id": created_encounter_id,
              "status": status,
              "characteristics": characteristics,
              "errors": errors,
              "encounter_creation_input": encounter_creation_input
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ChargeCaptureClaimCreation
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            created_encounter_id = struct["created_encounter_id"]
            status = struct["status"]
            characteristics = struct["characteristics"]
            errors = parsed_json["errors"]&.map do |item|
              item = item.to_json
              CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError.from_json(json_object: item)
            end
            if parsed_json["encounter_creation_input"].nil?
              encounter_creation_input = nil
            else
              encounter_creation_input = parsed_json["encounter_creation_input"].to_json
              encounter_creation_input = CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData.from_json(json_object: encounter_creation_input)
            end
            new(
              id: id,
              created_encounter_id: created_encounter_id,
              status: status,
              characteristics: characteristics,
              errors: errors,
              encounter_creation_input: encounter_creation_input,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCaptureClaimCreation to a JSON object
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
            obj.created_encounter_id&.is_a?(String) != false || raise("Passed value for field obj.created_encounter_id is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.characteristics.is_a?(Hash) != false || raise("Passed value for field obj.characteristics is not the expected type, validation failed.")
            obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
            obj.encounter_creation_input.nil? || CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData.validate_raw(obj: obj.encounter_creation_input)
          end
        end
      end
    end
  end
end
