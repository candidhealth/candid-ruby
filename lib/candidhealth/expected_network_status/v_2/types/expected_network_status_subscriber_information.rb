# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_uuid"
require_relative "insurance_type"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ExpectedNetworkStatusSubscriberInformation
        attr_reader :payer_uuid, :member_id, :insurance_type, :additional_properties

        # @param payer_uuid [Payers::V3::PAYER_String] The String that corresponds with the payer on the patient’s insurance card
        # @param member_id [String] The member_id on the patient’s insurance card
        # @param insurance_type [ExpectedNetworkStatus::V2::InsuranceType] The insurance information on the patient's insurance card
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation]
        def initialize(payer_uuid:, member_id:, insurance_type:, additional_properties: nil)
          # @type [Payers::V3::PAYER_String] The String that corresponds with the payer on the patient’s insurance card
          @payer_uuid = payer_uuid
          # @type [String] The member_id on the patient’s insurance card
          @member_id = member_id
          # @type [ExpectedNetworkStatus::V2::InsuranceType] The insurance information on the patient's insurance card
          @insurance_type = insurance_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ExpectedNetworkStatusSubscriberInformation
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          payer_uuid = struct.payer_uuid
          member_id = struct.member_id
          if parsed_json["insurance_type"].nil?
            insurance_type = nil
          else
            insurance_type = parsed_json["insurance_type"].to_json
            insurance_type = ExpectedNetworkStatus::V2::InsuranceType.from_json(json_object: insurance_type)
          end
          new(payer_uuid: payer_uuid, member_id: member_id, insurance_type: insurance_type,
              additional_properties: struct)
        end

        # Serialize an instance of ExpectedNetworkStatusSubscriberInformation to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "payer_uuid": @payer_uuid, "member_id": @member_id, "insurance_type": @insurance_type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
          obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
          ExpectedNetworkStatus::V2::InsuranceType.validate_raw(obj: obj.insurance_type)
        end
      end
    end
  end
end
