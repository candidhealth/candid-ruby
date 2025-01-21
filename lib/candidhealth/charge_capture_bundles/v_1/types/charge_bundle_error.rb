# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeBundleError
          # @return [String]
          attr_reader :id
          # @return [String] The underlying Charge Capture that this error object references.
          #  The Charge Capture referenced will be a part of the bundle tied to this error.
          #  Errors may also refer to all charge_captures present in a bundle, in which case
          #  this field will be null.
          attr_reader :charge_capture_id
          # @return [String] A human readable error explaining why this charge capture bundle failed to
          #  create a claim.
          attr_reader :message
          # @return [String] The field of the corresponding underlying ChargeCapture that has a field that is
          #  failing validations,
          #  is not present but marked as required, or otherwise in error.
          attr_reader :field_in_error
          # @return [String] The ID of the ChargeCaptureBundle associated with this Error.
          attr_reader :bundle_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param charge_capture_id [String] The underlying Charge Capture that this error object references.
          #  The Charge Capture referenced will be a part of the bundle tied to this error.
          #  Errors may also refer to all charge_captures present in a bundle, in which case
          #  this field will be null.
          # @param message [String] A human readable error explaining why this charge capture bundle failed to
          #  create a claim.
          # @param field_in_error [String] The field of the corresponding underlying ChargeCapture that has a field that is
          #  failing validations,
          #  is not present but marked as required, or otherwise in error.
          # @param bundle_id [String] The ID of the ChargeCaptureBundle associated with this Error.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeBundleError]
          def initialize(id:, message:, bundle_id:, charge_capture_id: OMIT, field_in_error: OMIT,
                         additional_properties: nil)
            @id = id
            @charge_capture_id = charge_capture_id if charge_capture_id != OMIT
            @message = message
            @field_in_error = field_in_error if field_in_error != OMIT
            @bundle_id = bundle_id
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "charge_capture_id": charge_capture_id,
              "message": message,
              "field_in_error": field_in_error,
              "bundle_id": bundle_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ChargeBundleError
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCaptureBundles::V1::Types::ChargeBundleError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            id = struct["id"]
            charge_capture_id = struct["charge_capture_id"]
            message = struct["message"]
            field_in_error = struct["field_in_error"]
            bundle_id = struct["bundle_id"]
            new(
              id: id,
              charge_capture_id: charge_capture_id,
              message: message,
              field_in_error: field_in_error,
              bundle_id: bundle_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeBundleError to a JSON object
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
            obj.charge_capture_id&.is_a?(String) != false || raise("Passed value for field obj.charge_capture_id is not the expected type, validation failed.")
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            obj.field_in_error&.is_a?(String) != false || raise("Passed value for field obj.field_in_error is not the expected type, validation failed.")
            obj.bundle_id.is_a?(String) != false || raise("Passed value for field obj.bundle_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
