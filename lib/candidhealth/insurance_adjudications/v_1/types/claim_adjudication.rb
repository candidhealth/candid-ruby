# frozen_string_literal: true

require_relative "../../../x_12/v_1/types/claim_adjustment_reason_code"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      module Types
        class ClaimAdjudication
          # @return [String]
          attr_reader :claim_id
          # @return [Integer]
          attr_reader :insurance_allowed_amount_cents
          # @return [Integer]
          attr_reader :insurance_paid_amount_cents
          # @return [Integer]
          attr_reader :charge_amount_cents
          # @return [Hash{String => Array}]
          attr_reader :service_lines
          # @return [String]
          attr_reader :payer_claim_number
          # @return [Array<CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode>]
          attr_reader :carcs
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_id [String]
          # @param insurance_allowed_amount_cents [Integer]
          # @param insurance_paid_amount_cents [Integer]
          # @param charge_amount_cents [Integer]
          # @param service_lines [Hash{String => Array}]
          # @param payer_claim_number [String]
          # @param carcs [Array<CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::ClaimAdjudication]
          def initialize(claim_id:, service_lines:, carcs:, insurance_allowed_amount_cents: OMIT, insurance_paid_amount_cents: OMIT,
                         charge_amount_cents: OMIT, payer_claim_number: OMIT, additional_properties: nil)
            @claim_id = claim_id
            @insurance_allowed_amount_cents = insurance_allowed_amount_cents if insurance_allowed_amount_cents != OMIT
            @insurance_paid_amount_cents = insurance_paid_amount_cents if insurance_paid_amount_cents != OMIT
            @charge_amount_cents = charge_amount_cents if charge_amount_cents != OMIT
            @service_lines = service_lines
            @payer_claim_number = payer_claim_number if payer_claim_number != OMIT
            @carcs = carcs
            @additional_properties = additional_properties
            @_field_set = {
              "claim_id": claim_id,
              "insurance_allowed_amount_cents": insurance_allowed_amount_cents,
              "insurance_paid_amount_cents": insurance_paid_amount_cents,
              "charge_amount_cents": charge_amount_cents,
              "service_lines": service_lines,
              "payer_claim_number": payer_claim_number,
              "carcs": carcs
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClaimAdjudication
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::ClaimAdjudication]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            claim_id = struct["claim_id"]
            insurance_allowed_amount_cents = struct["insurance_allowed_amount_cents"]
            insurance_paid_amount_cents = struct["insurance_paid_amount_cents"]
            charge_amount_cents = struct["charge_amount_cents"]
            service_lines = parsed_json["service_lines"]&.transform_values do |value|
              value&.map do |item|
                item = item.to_json
                CandidApiClient::InsuranceAdjudications::V1::Types::ServiceLineAdjudication.from_json(json_object: item)
              end
            end
            payer_claim_number = struct["payer_claim_number"]
            carcs = parsed_json["carcs"]&.map do |item|
              item = item.to_json
              CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode.from_json(json_object: item)
            end
            new(
              claim_id: claim_id,
              insurance_allowed_amount_cents: insurance_allowed_amount_cents,
              insurance_paid_amount_cents: insurance_paid_amount_cents,
              charge_amount_cents: charge_amount_cents,
              service_lines: service_lines,
              payer_claim_number: payer_claim_number,
              carcs: carcs,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClaimAdjudication to a JSON object
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
            obj.insurance_allowed_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_allowed_amount_cents is not the expected type, validation failed.")
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
end
