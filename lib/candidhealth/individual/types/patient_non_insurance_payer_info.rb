# frozen_string_literal: true

require_relative "../../non_insurance_payers/v_1/types/non_insurance_payer"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientNonInsurancePayerInfo
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        attr_reader :non_insurance_payer
        # @return [String]
        attr_reader :member_id
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param non_insurance_payer [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @param member_id [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo]
        def initialize(non_insurance_payer:, member_id: OMIT, additional_properties: nil)
          @non_insurance_payer = non_insurance_payer
          @member_id = member_id if member_id != OMIT
          @additional_properties = additional_properties
          @_field_set = { "non_insurance_payer": non_insurance_payer, "member_id": member_id }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientNonInsurancePayerInfo
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["non_insurance_payer"].nil?
            non_insurance_payer = nil
          else
            non_insurance_payer = parsed_json["non_insurance_payer"].to_json
            non_insurance_payer = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: non_insurance_payer)
          end
          member_id = struct["member_id"]
          new(
            non_insurance_payer: non_insurance_payer,
            member_id: member_id,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientNonInsurancePayerInfo to a JSON object
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
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.validate_raw(obj: obj.non_insurance_payer)
          obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
        end
      end
    end
  end
end