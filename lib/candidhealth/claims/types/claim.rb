# frozen_string_literal: true

require_relative "claim_status"
require_relative "../../service_lines/v_2/types/service_line"
require_relative "../../era/types/era"
require "ostruct"
require "json"

module CandidApiClient
  module Claims
    module Types
      class Claim
        # @return [String]
        attr_reader :claim_id
        # @return [CandidApiClient::Claims::Types::ClaimStatus]
        attr_reader :status
        # @return [String]
        attr_reader :clearinghouse
        # @return [String]
        attr_reader :clearinghouse_claim_id
        # @return [String]
        attr_reader :payer_claim_id
        # @return [String]
        attr_reader :clia_number
        # @return [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLine>]
        attr_reader :service_lines
        # @return [Array<CandidApiClient::Era::Types::Era>]
        attr_reader :eras
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param claim_id [String]
        # @param status [CandidApiClient::Claims::Types::ClaimStatus]
        # @param clearinghouse [String]
        # @param clearinghouse_claim_id [String]
        # @param payer_claim_id [String]
        # @param clia_number [String]
        # @param service_lines [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLine>]
        # @param eras [Array<CandidApiClient::Era::Types::Era>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Claims::Types::Claim]
        def initialize(claim_id:, status:, service_lines:, eras:, clearinghouse: OMIT, clearinghouse_claim_id: OMIT, payer_claim_id: OMIT,
                       clia_number: OMIT, additional_properties: nil)
          @claim_id = claim_id
          @status = status
          @clearinghouse = clearinghouse if clearinghouse != OMIT
          @clearinghouse_claim_id = clearinghouse_claim_id if clearinghouse_claim_id != OMIT
          @payer_claim_id = payer_claim_id if payer_claim_id != OMIT
          @clia_number = clia_number if clia_number != OMIT
          @service_lines = service_lines
          @eras = eras
          @additional_properties = additional_properties
          @_field_set = {
            "claim_id": claim_id,
            "status": status,
            "clearinghouse": clearinghouse,
            "clearinghouse_claim_id": clearinghouse_claim_id,
            "payer_claim_id": payer_claim_id,
            "clia_number": clia_number,
            "service_lines": service_lines,
            "eras": eras
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of Claim
        #
        # @param json_object [String]
        # @return [CandidApiClient::Claims::Types::Claim]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          claim_id = struct["claim_id"]
          status = struct["status"]
          clearinghouse = struct["clearinghouse"]
          clearinghouse_claim_id = struct["clearinghouse_claim_id"]
          payer_claim_id = struct["payer_claim_id"]
          clia_number = struct["clia_number"]
          service_lines = parsed_json["service_lines"]&.map do |item|
            item = item.to_json
            CandidApiClient::ServiceLines::V2::Types::ServiceLine.from_json(json_object: item)
          end
          eras = parsed_json["eras"]&.map do |item|
            item = item.to_json
            CandidApiClient::Era::Types::Era.from_json(json_object: item)
          end
          new(
            claim_id: claim_id,
            status: status,
            clearinghouse: clearinghouse,
            clearinghouse_claim_id: clearinghouse_claim_id,
            payer_claim_id: payer_claim_id,
            clia_number: clia_number,
            service_lines: service_lines,
            eras: eras,
            additional_properties: struct
          )
        end

        # Serialize an instance of Claim to a JSON object
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
          obj.status.is_a?(CandidApiClient::Claims::Types::ClaimStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.clearinghouse&.is_a?(String) != false || raise("Passed value for field obj.clearinghouse is not the expected type, validation failed.")
          obj.clearinghouse_claim_id&.is_a?(String) != false || raise("Passed value for field obj.clearinghouse_claim_id is not the expected type, validation failed.")
          obj.payer_claim_id&.is_a?(String) != false || raise("Passed value for field obj.payer_claim_id is not the expected type, validation failed.")
          obj.clia_number&.is_a?(String) != false || raise("Passed value for field obj.clia_number is not the expected type, validation failed.")
          obj.service_lines.is_a?(Array) != false || raise("Passed value for field obj.service_lines is not the expected type, validation failed.")
          obj.eras.is_a?(Array) != false || raise("Passed value for field obj.eras is not the expected type, validation failed.")
        end
      end
    end
  end
end
