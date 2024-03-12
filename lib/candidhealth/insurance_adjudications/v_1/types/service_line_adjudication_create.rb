# frozen_string_literal: true

require_relative "../../../service_lines/v_2/types/denial_reason_content"
require_relative "../../../x_12/v_1/types/claim_adjustment_reason_code"
require_relative "../../../x_12/v_1/types/remittance_advice_remark_code"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class ServiceLineAdjudicationCreate
        attr_reader :denial_reason, :insurance_allowed_amount_cents, :insurance_paid_amount_cents,
                    :deductible_amount_cents, :coinsurance_amount_cents, :copay_amount_cents, :carcs, :rarcs, :additional_properties

        # @param denial_reason [ServiceLines::V2::DenialReasonContent] Will be treated as a denial if present
        # @param insurance_allowed_amount_cents [Integer]
        # @param insurance_paid_amount_cents [Integer]
        # @param deductible_amount_cents [Integer]
        # @param coinsurance_amount_cents [Integer]
        # @param copay_amount_cents [Integer]
        # @param carcs [Array<X12::V1::ClaimAdjustmentReasonCode>]
        # @param rarcs [Array<X12::V1::RemittanceAdviceRemarkCode>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceAdjudications::V1::ServiceLineAdjudicationCreate]
        def initialize(carcs:, rarcs:, denial_reason: nil, insurance_allowed_amount_cents: nil, insurance_paid_amount_cents: nil,
                       deductible_amount_cents: nil, coinsurance_amount_cents: nil, copay_amount_cents: nil, additional_properties: nil)
          # @type [ServiceLines::V2::DenialReasonContent] Will be treated as a denial if present
          @denial_reason = denial_reason
          # @type [Integer]
          @insurance_allowed_amount_cents = insurance_allowed_amount_cents
          # @type [Integer]
          @insurance_paid_amount_cents = insurance_paid_amount_cents
          # @type [Integer]
          @deductible_amount_cents = deductible_amount_cents
          # @type [Integer]
          @coinsurance_amount_cents = coinsurance_amount_cents
          # @type [Integer]
          @copay_amount_cents = copay_amount_cents
          # @type [Array<X12::V1::ClaimAdjustmentReasonCode>]
          @carcs = carcs
          # @type [Array<X12::V1::RemittanceAdviceRemarkCode>]
          @rarcs = rarcs
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLineAdjudicationCreate
        #
        # @param json_object [JSON]
        # @return [InsuranceAdjudications::V1::ServiceLineAdjudicationCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          denial_reason = struct.denial_reason
          insurance_allowed_amount_cents = struct.insurance_allowed_amount_cents
          insurance_paid_amount_cents = struct.insurance_paid_amount_cents
          deductible_amount_cents = struct.deductible_amount_cents
          coinsurance_amount_cents = struct.coinsurance_amount_cents
          copay_amount_cents = struct.copay_amount_cents
          carcs = parsed_json["carcs"]&.map do |v|
            v = v.to_json
            X12::V1::ClaimAdjustmentReasonCode.from_json(json_object: v)
          end
          rarcs = parsed_json["rarcs"]&.map do |v|
            v = v.to_json
            X12::V1::RemittanceAdviceRemarkCode.from_json(json_object: v)
          end
          new(denial_reason: denial_reason, insurance_allowed_amount_cents: insurance_allowed_amount_cents,
              insurance_paid_amount_cents: insurance_paid_amount_cents, deductible_amount_cents: deductible_amount_cents, coinsurance_amount_cents: coinsurance_amount_cents, copay_amount_cents: copay_amount_cents, carcs: carcs, rarcs: rarcs, additional_properties: struct)
        end

        # Serialize an instance of ServiceLineAdjudicationCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "denial_reason": @denial_reason,
            "insurance_allowed_amount_cents": @insurance_allowed_amount_cents,
            "insurance_paid_amount_cents": @insurance_paid_amount_cents,
            "deductible_amount_cents": @deductible_amount_cents,
            "coinsurance_amount_cents": @coinsurance_amount_cents,
            "copay_amount_cents": @copay_amount_cents,
            "carcs": @carcs,
            "rarcs": @rarcs
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.denial_reason&.is_a?(ServiceLines::V2::DenialReasonContent) != false || raise("Passed value for field obj.denial_reason is not the expected type, validation failed.")
          obj.insurance_allowed_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_allowed_amount_cents is not the expected type, validation failed.")
          obj.insurance_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_paid_amount_cents is not the expected type, validation failed.")
          obj.deductible_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.deductible_amount_cents is not the expected type, validation failed.")
          obj.coinsurance_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.coinsurance_amount_cents is not the expected type, validation failed.")
          obj.copay_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.copay_amount_cents is not the expected type, validation failed.")
          obj.carcs.is_a?(Array) != false || raise("Passed value for field obj.carcs is not the expected type, validation failed.")
          obj.rarcs.is_a?(Array) != false || raise("Passed value for field obj.rarcs is not the expected type, validation failed.")
        end
      end
    end
  end
end
