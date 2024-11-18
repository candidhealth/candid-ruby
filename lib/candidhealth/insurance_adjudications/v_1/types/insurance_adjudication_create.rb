# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_identifier"
require_relative "../../../remits/v_1/types/payee"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      module Types
        class InsuranceAdjudicationCreate
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          attr_reader :payer_identifier
          # @return [CandidApiClient::Remits::V1::Types::Payee]
          attr_reader :payee
          # @return [Date]
          attr_reader :post_date
          # @return [String]
          attr_reader :check_number
          # @return [Date]
          attr_reader :check_date
          # @return [String]
          attr_reader :note
          # @return [Hash{String => Array}]
          attr_reader :claims
          # @return [String]
          attr_reader :remit_draft_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_identifier [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          # @param payee [CandidApiClient::Remits::V1::Types::Payee]
          # @param post_date [Date]
          # @param check_number [String]
          # @param check_date [Date]
          # @param note [String]
          # @param claims [Hash{String => Array}]
          # @param remit_draft_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate]
          def initialize(payer_identifier:, payee:, check_date:, claims:, post_date: OMIT, check_number: OMIT,
                         note: OMIT, remit_draft_id: OMIT, additional_properties: nil)
            @payer_identifier = payer_identifier
            @payee = payee
            @post_date = post_date if post_date != OMIT
            @check_number = check_number if check_number != OMIT
            @check_date = check_date
            @note = note if note != OMIT
            @claims = claims
            @remit_draft_id = remit_draft_id if remit_draft_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "payer_identifier": payer_identifier,
              "payee": payee,
              "post_date": post_date,
              "check_number": check_number,
              "check_date": check_date,
              "note": note,
              "claims": claims,
              "remit_draft_id": remit_draft_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceAdjudicationCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["payer_identifier"].nil?
              payer_identifier = nil
            else
              payer_identifier = parsed_json["payer_identifier"].to_json
              payer_identifier = CandidApiClient::Payers::V3::Types::PayerIdentifier.from_json(json_object: payer_identifier)
            end
            if parsed_json["payee"].nil?
              payee = nil
            else
              payee = parsed_json["payee"].to_json
              payee = CandidApiClient::Remits::V1::Types::Payee.from_json(json_object: payee)
            end
            post_date = (Date.parse(parsed_json["post_date"]) unless parsed_json["post_date"].nil?)
            check_number = struct["check_number"]
            check_date = (Date.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
            note = struct["note"]
            claims = parsed_json["claims"]&.transform_values do |value|
              value&.map do |item|
                item = item.to_json
                CandidApiClient::InsuranceAdjudications::V1::Types::ClaimAdjudicationCreate.from_json(json_object: item)
              end
            end
            remit_draft_id = struct["remit_draft_id"]
            new(
              payer_identifier: payer_identifier,
              payee: payee,
              post_date: post_date,
              check_number: check_number,
              check_date: check_date,
              note: note,
              claims: claims,
              remit_draft_id: remit_draft_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceAdjudicationCreate to a JSON object
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
            CandidApiClient::Payers::V3::Types::PayerIdentifier.validate_raw(obj: obj.payer_identifier)
            CandidApiClient::Remits::V1::Types::Payee.validate_raw(obj: obj.payee)
            obj.post_date&.is_a?(Date) != false || raise("Passed value for field obj.post_date is not the expected type, validation failed.")
            obj.check_number&.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
            obj.check_date.is_a?(Date) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
            obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
            obj.claims.is_a?(Hash) != false || raise("Passed value for field obj.claims is not the expected type, validation failed.")
            obj.remit_draft_id&.is_a?(String) != false || raise("Passed value for field obj.remit_draft_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
