# frozen_string_literal: true

require_relative "../../commons/types/claim_id"
require_relative "claim_status"
require_relative "../../service_lines/v_2/types/service_line"
require_relative "../../era/types/era"
require "json"

module CandidApiClient
  class Claims
    class Claim
      attr_reader :claim_id, :status, :clearinghouse, :clearinghouse_claim_id, :payer_claim_id, :clia_number,
                  :service_lines, :eras, :additional_properties

      # @param claim_id [Commons::CLAIM_ID]
      # @param status [Claims::ClaimStatus]
      # @param clearinghouse [String]
      # @param clearinghouse_claim_id [String]
      # @param payer_claim_id [String]
      # @param clia_number [String]
      # @param service_lines [Array<ServiceLines::V2::ServiceLine>]
      # @param eras [Array<Era::Era>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Claims::Claim]
      def initialize(claim_id:, status:, service_lines:, eras:, clearinghouse: nil, clearinghouse_claim_id: nil, payer_claim_id: nil,
                     clia_number: nil, additional_properties: nil)
        # @type [Commons::CLAIM_ID]
        @claim_id = claim_id
        # @type [Claims::ClaimStatus]
        @status = status
        # @type [String]
        @clearinghouse = clearinghouse
        # @type [String]
        @clearinghouse_claim_id = clearinghouse_claim_id
        # @type [String]
        @payer_claim_id = payer_claim_id
        # @type [String]
        @clia_number = clia_number
        # @type [Array<ServiceLines::V2::ServiceLine>]
        @service_lines = service_lines
        # @type [Array<Era::Era>]
        @eras = eras
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Claim
      #
      # @param json_object [JSON]
      # @return [Claims::Claim]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        claim_id = struct.claim_id
        status = struct.status
        clearinghouse = struct.clearinghouse
        clearinghouse_claim_id = struct.clearinghouse_claim_id
        payer_claim_id = struct.payer_claim_id
        clia_number = struct.clia_number
        service_lines = parsed_json["service_lines"]&.map do |v|
          v = v.to_json
          ServiceLines::V2::ServiceLine.from_json(json_object: v)
        end
        eras = parsed_json["eras"]&.map do |v|
          v = v.to_json
          Era::Era.from_json(json_object: v)
        end
        new(claim_id: claim_id, status: status, clearinghouse: clearinghouse,
            clearinghouse_claim_id: clearinghouse_claim_id, payer_claim_id: payer_claim_id, clia_number: clia_number, service_lines: service_lines, eras: eras, additional_properties: struct)
      end

      # Serialize an instance of Claim to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "claim_id": @claim_id,
          "status": @status,
          "clearinghouse": @clearinghouse,
          "clearinghouse_claim_id": @clearinghouse_claim_id,
          "payer_claim_id": @payer_claim_id,
          "clia_number": @clia_number,
          "service_lines": @service_lines,
          "eras": @eras
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.claim_id.is_a?(UUID) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
        obj.status.is_a?(Claims::ClaimStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
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
