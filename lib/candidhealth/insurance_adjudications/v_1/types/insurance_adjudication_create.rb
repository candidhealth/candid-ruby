# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_identifier"
require_relative "../../../remits/v_1/types/payee"
require "date"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class InsuranceAdjudicationCreate
        attr_reader :payer_identifier, :payee, :post_date, :check_number, :check_date, :note, :claims,
                    :additional_properties

        # @param payer_identifier [Payers::V3::PayerIdentifier]
        # @param payee [Remits::V1::Payee]
        # @param post_date [Date]
        # @param check_number [String]
        # @param check_date [Date]
        # @param note [String]
        # @param claims [Hash{Commons::CLAIM_ID => Array}]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceAdjudications::V1::InsuranceAdjudicationCreate]
        def initialize(payer_identifier:, payee:, check_date:, claims:, post_date: nil, check_number: nil, note: nil,
                       additional_properties: nil)
          # @type [Payers::V3::PayerIdentifier]
          @payer_identifier = payer_identifier
          # @type [Remits::V1::Payee]
          @payee = payee
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

        # Deserialize a JSON object to an instance of InsuranceAdjudicationCreate
        #
        # @param json_object [JSON]
        # @return [InsuranceAdjudications::V1::InsuranceAdjudicationCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["payer_identifier"].nil?
            payer_identifier = nil
          else
            payer_identifier = parsed_json["payer_identifier"].to_json
            payer_identifier = Payers::V3::PayerIdentifier.from_json(json_object: payer_identifier)
          end
          if parsed_json["payee"].nil?
            payee = nil
          else
            payee = parsed_json["payee"].to_json
            payee = Remits::V1::Payee.from_json(json_object: payee)
          end
          post_date = (Date.parse(parsed_json["post_date"]) unless parsed_json["post_date"].nil?)
          check_number = struct.check_number
          check_date = (Date.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
          note = struct.note
          claims = parsed_json["claims"]&.transform_values do |_k, v|
            v = v.to_json
            v&.map do |v|
              v = v.to_json
              InsuranceAdjudications::V1::ClaimAdjudicationCreate.from_json(json_object: v)
            end
          end
          new(payer_identifier: payer_identifier, payee: payee, post_date: post_date, check_number: check_number,
              check_date: check_date, note: note, claims: claims, additional_properties: struct)
        end

        # Serialize an instance of InsuranceAdjudicationCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer_identifier": @payer_identifier,
            "payee": @payee,
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
          Payers::V3::PayerIdentifier.validate_raw(obj: obj.payer_identifier)
          Remits::V1::Payee.validate_raw(obj: obj.payee)
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
