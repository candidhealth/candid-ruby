# frozen_string_literal: true

require_relative "charge_capture_bundle_status"
require_relative "../../../charge_capture/v_1/types/charge_capture"
require_relative "../../../charge_capture/v_1/types/charge_capture_error"
require "ostruct"
require "json"

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureBundle
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :created_encounter_id
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleStatus] Status of the Bundle, Successful means that the Bundle created a corresponding
          #  Claim
          attr_reader :status
          # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapture>] All the underlying ChargeCaptures that are present in a ChargeCaptureBundle.
          attr_reader :charge_captures
          # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError>] All errors that were found when the bundle was attempted to be created.
          #  Errors can correspond to the Bundle as a whole or specific underlying Charge
          #  Captures.
          attr_reader :errors
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param created_encounter_id [String]
          # @param status [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleStatus] Status of the Bundle, Successful means that the Bundle created a corresponding
          #  Claim
          # @param charge_captures [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapture>] All the underlying ChargeCaptures that are present in a ChargeCaptureBundle.
          # @param errors [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError>] All errors that were found when the bundle was attempted to be created.
          #  Errors can correspond to the Bundle as a whole or specific underlying Charge
          #  Captures.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
          def initialize(id:, status:, charge_captures:, errors:, created_encounter_id: OMIT,
                         additional_properties: nil)
            @id = id
            @created_encounter_id = created_encounter_id if created_encounter_id != OMIT
            @status = status
            @charge_captures = charge_captures
            @errors = errors
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "created_encounter_id": created_encounter_id,
              "status": status,
              "charge_captures": charge_captures,
              "errors": errors
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ChargeCaptureBundle
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundle]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            created_encounter_id = struct["created_encounter_id"]
            status = struct["status"]
            charge_captures = parsed_json["charge_captures"]&.map do |item|
              item = item.to_json
              CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: item)
            end
            errors = parsed_json["errors"]&.map do |item|
              item = item.to_json
              CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureError.from_json(json_object: item)
            end
            new(
              id: id,
              created_encounter_id: created_encounter_id,
              status: status,
              charge_captures: charge_captures,
              errors: errors,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCaptureBundle to a JSON object
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
            obj.status.is_a?(CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeCaptureBundleStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.charge_captures.is_a?(Array) != false || raise("Passed value for field obj.charge_captures is not the expected type, validation failed.")
            obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
