# frozen_string_literal: true

require_relative "insurance_type"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusSubscriberInformation
          # @return [String] The UUID that corresponds with the payer on the patient’s insurance card
          attr_reader :payer_uuid
          # @return [String] The member_id on the patient’s insurance card
          attr_reader :member_id
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType] The insurance information on the patient's insurance card
          attr_reader :insurance_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_uuid [String] The UUID that corresponds with the payer on the patient’s insurance card
          # @param member_id [String] The member_id on the patient’s insurance card
          # @param insurance_type [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType] The insurance information on the patient's insurance card
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusSubscriberInformation]
          def initialize(payer_uuid:, member_id:, insurance_type:, additional_properties: nil)
            @payer_uuid = payer_uuid
            @member_id = member_id
            @insurance_type = insurance_type
            @additional_properties = additional_properties
            @_field_set = { "payer_uuid": payer_uuid, "member_id": member_id, "insurance_type": insurance_type }
          end

          # Deserialize a JSON object to an instance of
          #  ExpectedNetworkStatusSubscriberInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusSubscriberInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_uuid = struct["payer_uuid"]
            member_id = struct["member_id"]
            if parsed_json["insurance_type"].nil?
              insurance_type = nil
            else
              insurance_type = parsed_json["insurance_type"].to_json
              insurance_type = CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType.from_json(json_object: insurance_type)
            end
            new(
              payer_uuid: payer_uuid,
              member_id: member_id,
              insurance_type: insurance_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExpectedNetworkStatusSubscriberInformation to a JSON
          #  object
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
            obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
            CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType.validate_raw(obj: obj.insurance_type)
          end
        end
      end
    end
  end
end
