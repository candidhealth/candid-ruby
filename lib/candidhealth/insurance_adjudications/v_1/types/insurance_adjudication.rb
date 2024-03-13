# frozen_string_literal: true

require_relative "insurance_adjudication_id"
require_relative "../../../payers/v_3/types/payer_uuid"
require "date"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class InsuranceAdjudication
        attr_reader :insurance_adjudication_id, :payer_uuid, :post_date, :check_number, :check_date, :note, :claims,
                    :additional_properties

        # @param insurance_adjudication_id [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
        # @param payer_uuid [Payers::V3::PAYER_String]
        # @param post_date [Date]
        # @param check_number [String]
        # @param check_date [Date]
        # @param note [String]
        # @param claims [Hash{Commons::CLAIM_ID => Array}]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def initialize(insurance_adjudication_id:, payer_uuid:, check_date:, claims:, post_date: nil, check_number: nil,
                       note: nil, additional_properties: nil)
          # @type [InsuranceAdjudications::V1::INSURANCE_ADJUDICATION_ID]
          @insurance_adjudication_id = insurance_adjudication_id
          # @type [Payers::V3::PAYER_String]
          @payer_uuid = payer_uuid
          # @type [Date]
          @post_date = post_date
          # @type [String]
          @check_number = check_number
          # @type [Date]
          @check_date = check_date
          # @type [String]
          @note = note
          # @type [Hash{Commons::CLAIM_ID => Array}]
          @claims = claims
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceAdjudication
        #
        # @param json_object [JSON]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudication]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          insurance_adjudication_id = struct.insurance_adjudication_id
          payer_uuid = struct.payer_uuid
          post_date = (Date.parse(parsed_json["post_date"]) unless parsed_json["post_date"].nil?)
          check_number = struct.check_number
          check_date = (Date.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
          note = struct.note
          claims = parsed_json["claims"]&.transform_values do |_k, v|
            v = v.to_json
            v&.map do |v|
              v = v.to_json
              InsuranceAdjudications::V1::ClaimAdjudication.from_json(json_object: v)
            end
          end
          new(insurance_adjudication_id: insurance_adjudication_id, payer_uuid: payer_uuid, post_date: post_date,
              check_number: check_number, check_date: check_date, note: note, claims: claims, additional_properties: struct)
        end

        # Serialize an instance of InsuranceAdjudication to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "insurance_adjudication_id": @insurance_adjudication_id,
            "payer_uuid": @payer_uuid,
            "post_date": @post_date,
            "check_number": @check_number,
            "check_date": @check_date,
            "note": @note,
            "claims": @claims
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.insurance_adjudication_id.is_a?(String) != false || raise("Passed value for field obj.insurance_adjudication_id is not the expected type, validation failed.")
          obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
          obj.post_date&.is_a?(Date) != false || raise("Passed value for field obj.post_date is not the expected type, validation failed.")
          obj.check_number&.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
          obj.check_date.is_a?(Date) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.claims.is_a?(Hash) != false || raise("Passed value for field obj.claims is not the expected type, validation failed.")
        end
      end
    end
  end
end
