# frozen_string_literal: true

require_relative "../../../era_commons/types/claim_status_code_create"
require_relative "../../../x_12/v_1/types/claim_adjustment_reason_code"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class ClaimAdjudicationCreate
        attr_reader :claim_status_code, :insurance_paid_amount_cents, :charge_amount_cents, :service_lines,
                    :payer_claim_number, :carcs, :additional_properties

        # @param claim_status_code [EraCommons::ClaimStatusCodeCreate]
        # @param insurance_paid_amount_cents [Integer]
        # @param charge_amount_cents [Integer]
        # @param service_lines [Hash{Commons::SERVICE_LINE_ID => Array}]
        # @param payer_claim_number [String]
        # @param carcs [Array<X12::V1::ClaimAdjustmentReasonCode>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceAdjudications::V1::ClaimAdjudicationCreate]
        def initialize(claim_status_code:, service_lines:, carcs:, insurance_paid_amount_cents: nil, charge_amount_cents: nil,
                       payer_claim_number: nil, additional_properties: nil)
          # @type [EraCommons::ClaimStatusCodeCreate]
          @claim_status_code = claim_status_code
          # @type [Integer]
          @insurance_paid_amount_cents = insurance_paid_amount_cents
          # @type [Integer]
          @charge_amount_cents = charge_amount_cents
          # @type [Hash{Commons::SERVICE_LINE_ID => Array}]
          @service_lines = service_lines
          # @type [String]
          @payer_claim_number = payer_claim_number
          # @type [Array<X12::V1::ClaimAdjustmentReasonCode>]
          @carcs = carcs
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClaimAdjudicationCreate
        #
        # @param json_object [JSON]
        # @return [InsuranceAdjudications::V1::ClaimAdjudicationCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          claim_status_code = struct.claim_status_code
          insurance_paid_amount_cents = struct.insurance_paid_amount_cents
          charge_amount_cents = struct.charge_amount_cents
          service_lines = parsed_json["service_lines"]&.transform_values do |_k, v|
            v = v.to_json
            v&.map do |v|
              v = v.to_json
              InsuranceAdjudications::V1::ServiceLineAdjudicationCreate.from_json(json_object: v)
            end
          end
          payer_claim_number = struct.payer_claim_number
          carcs = parsed_json["carcs"]&.map do |v|
            v = v.to_json
            X12::V1::ClaimAdjustmentReasonCode.from_json(json_object: v)
          end
          new(claim_status_code: claim_status_code, insurance_paid_amount_cents: insurance_paid_amount_cents,
              charge_amount_cents: charge_amount_cents, service_lines: service_lines, payer_claim_number: payer_claim_number, carcs: carcs, additional_properties: struct)
        end

        # Serialize an instance of ClaimAdjudicationCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "claim_status_code": @claim_status_code,
            "insurance_paid_amount_cents": @insurance_paid_amount_cents,
            "charge_amount_cents": @charge_amount_cents,
            "service_lines": @service_lines,
            "payer_claim_number": @payer_claim_number,
            "carcs": @carcs
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.claim_status_code.is_a?(EraCommons::ClaimStatusCodeCreate) != false || raise("Passed value for field obj.claim_status_code is not the expected type, validation failed.")
          obj.insurance_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_paid_amount_cents is not the expected type, validation failed.")
          obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
          obj.service_lines.is_a?(Hash) != false || raise("Passed value for field obj.service_lines is not the expected type, validation failed.")
          obj.payer_claim_number&.is_a?(String) != false || raise("Passed value for field obj.payer_claim_number is not the expected type, validation failed.")
          obj.carcs.is_a?(Array) != false || raise("Passed value for field obj.carcs is not the expected type, validation failed.")
        end
      end
    end
  end
end
