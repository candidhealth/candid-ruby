# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      module Types
        class InsuranceAdjudication
          # @return [String]
          attr_reader :insurance_adjudication_id
          # @return [String]
          attr_reader :payer_uuid
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
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param insurance_adjudication_id [String]
          # @param payer_uuid [String]
          # @param post_date [Date]
          # @param check_number [String]
          # @param check_date [Date]
          # @param note [String]
          # @param claims [Hash{String => Array}]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
          def initialize(insurance_adjudication_id:, payer_uuid:, check_date:, claims:, post_date: OMIT, check_number: OMIT,
                         note: OMIT, additional_properties: nil)
            @insurance_adjudication_id = insurance_adjudication_id
            @payer_uuid = payer_uuid
            @post_date = post_date if post_date != OMIT
            @check_number = check_number if check_number != OMIT
            @check_date = check_date
            @note = note if note != OMIT
            @claims = claims
            @additional_properties = additional_properties
            @_field_set = {
              "insurance_adjudication_id": insurance_adjudication_id,
              "payer_uuid": payer_uuid,
              "post_date": post_date,
              "check_number": check_number,
              "check_date": check_date,
              "note": note,
              "claims": claims
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceAdjudication
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            insurance_adjudication_id = struct["insurance_adjudication_id"]
            payer_uuid = struct["payer_uuid"]
            post_date = (Date.parse(parsed_json["post_date"]) unless parsed_json["post_date"].nil?)
            check_number = struct["check_number"]
            check_date = (Date.parse(parsed_json["check_date"]) unless parsed_json["check_date"].nil?)
            note = struct["note"]
            claims = parsed_json["claims"]&.transform_values do |value|
              value&.map do |item|
                item = item.to_json
                CandidApiClient::InsuranceAdjudications::V1::Types::ClaimAdjudication.from_json(json_object: item)
              end
            end
            new(
              insurance_adjudication_id: insurance_adjudication_id,
              payer_uuid: payer_uuid,
              post_date: post_date,
              check_number: check_number,
              check_date: check_date,
              note: note,
              claims: claims,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceAdjudication to a JSON object
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
end
