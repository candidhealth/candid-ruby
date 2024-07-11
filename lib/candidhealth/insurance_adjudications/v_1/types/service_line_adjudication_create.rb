# frozen_string_literal: true

require_relative "../../../service_lines/v_2/types/denial_reason_content"
require_relative "../../../x_12/v_1/types/claim_adjustment_reason_code"
require_relative "../../../x_12/v_1/types/remittance_advice_remark_code"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      module Types
        class ServiceLineAdjudicationCreate
          # @return [CandidApiClient::ServiceLines::V2::Types::DenialReasonContent] Will be treated as a denial if present
          attr_reader :denial_reason
          # @return [Integer]
          attr_reader :insurance_allowed_amount_cents
          # @return [Integer]
          attr_reader :insurance_paid_amount_cents
          # @return [Integer]
          attr_reader :deductible_amount_cents
          # @return [Integer]
          attr_reader :coinsurance_amount_cents
          # @return [Integer]
          attr_reader :copay_amount_cents
          # @return [Array<CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode>]
          attr_reader :carcs
          # @return [Array<CandidApiClient::X12::V1::Types::RemittanceAdviceRemarkCode>]
          attr_reader :rarcs
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param denial_reason [CandidApiClient::ServiceLines::V2::Types::DenialReasonContent] Will be treated as a denial if present
          # @param insurance_allowed_amount_cents [Integer]
          # @param insurance_paid_amount_cents [Integer]
          # @param deductible_amount_cents [Integer]
          # @param coinsurance_amount_cents [Integer]
          # @param copay_amount_cents [Integer]
          # @param carcs [Array<CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode>]
          # @param rarcs [Array<CandidApiClient::X12::V1::Types::RemittanceAdviceRemarkCode>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::ServiceLineAdjudicationCreate]
          def initialize(carcs:, rarcs:, denial_reason: OMIT, insurance_allowed_amount_cents: OMIT, insurance_paid_amount_cents: OMIT,
                         deductible_amount_cents: OMIT, coinsurance_amount_cents: OMIT, copay_amount_cents: OMIT, additional_properties: nil)
            @denial_reason = denial_reason if denial_reason != OMIT
            @insurance_allowed_amount_cents = insurance_allowed_amount_cents if insurance_allowed_amount_cents != OMIT
            @insurance_paid_amount_cents = insurance_paid_amount_cents if insurance_paid_amount_cents != OMIT
            @deductible_amount_cents = deductible_amount_cents if deductible_amount_cents != OMIT
            @coinsurance_amount_cents = coinsurance_amount_cents if coinsurance_amount_cents != OMIT
            @copay_amount_cents = copay_amount_cents if copay_amount_cents != OMIT
            @carcs = carcs
            @rarcs = rarcs
            @additional_properties = additional_properties
            @_field_set = {
              "denial_reason": denial_reason,
              "insurance_allowed_amount_cents": insurance_allowed_amount_cents,
              "insurance_paid_amount_cents": insurance_paid_amount_cents,
              "deductible_amount_cents": deductible_amount_cents,
              "coinsurance_amount_cents": coinsurance_amount_cents,
              "copay_amount_cents": copay_amount_cents,
              "carcs": carcs,
              "rarcs": rarcs
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLineAdjudicationCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::ServiceLineAdjudicationCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            denial_reason = struct["denial_reason"]
            insurance_allowed_amount_cents = struct["insurance_allowed_amount_cents"]
            insurance_paid_amount_cents = struct["insurance_paid_amount_cents"]
            deductible_amount_cents = struct["deductible_amount_cents"]
            coinsurance_amount_cents = struct["coinsurance_amount_cents"]
            copay_amount_cents = struct["copay_amount_cents"]
            carcs = parsed_json["carcs"]&.map do |item|
              item = item.to_json
              CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode.from_json(json_object: item)
            end
            rarcs = parsed_json["rarcs"]&.map do |item|
              item = item.to_json
              CandidApiClient::X12::V1::Types::RemittanceAdviceRemarkCode.from_json(json_object: item)
            end
            new(
              denial_reason: denial_reason,
              insurance_allowed_amount_cents: insurance_allowed_amount_cents,
              insurance_paid_amount_cents: insurance_paid_amount_cents,
              deductible_amount_cents: deductible_amount_cents,
              coinsurance_amount_cents: coinsurance_amount_cents,
              copay_amount_cents: copay_amount_cents,
              carcs: carcs,
              rarcs: rarcs,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineAdjudicationCreate to a JSON object
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
            obj.denial_reason&.is_a?(CandidApiClient::ServiceLines::V2::Types::DenialReasonContent) != false || raise("Passed value for field obj.denial_reason is not the expected type, validation failed.")
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
end
