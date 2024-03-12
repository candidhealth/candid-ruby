# frozen_string_literal: true

require_relative "../../../commons/types/source_of_payment_code"
require_relative "../../../commons/types/insurance_type_code"
require "json"

module CandidApiClient
  module InsuranceCards
    module V2
      class InsuranceCardBase
        attr_reader :group_number, :plan_name, :plan_type, :insurance_type, :additional_properties

        # @param group_number [String] Box 11 on the CMS-1500 claim form.
        # @param plan_name [String] Box 11c on the CMS-1500 claim form.
        # @param plan_type [Commons::SourceOfPaymentCode]
        # @param insurance_type [Commons::InsuranceTypeCode]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceCards::V2::InsuranceCardBase]
        def initialize(group_number: nil, plan_name: nil, plan_type: nil, insurance_type: nil,
                       additional_properties: nil)
          # @type [String] Box 11 on the CMS-1500 claim form.
          @group_number = group_number
          # @type [String] Box 11c on the CMS-1500 claim form.
          @plan_name = plan_name
          # @type [Commons::SourceOfPaymentCode]
          @plan_type = plan_type
          # @type [Commons::InsuranceTypeCode]
          @insurance_type = insurance_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceCardBase
        #
        # @param json_object [JSON]
        # @return [InsuranceCards::V2::InsuranceCardBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          group_number = struct.group_number
          plan_name = struct.plan_name
          plan_type = struct.plan_type
          insurance_type = struct.insurance_type
          new(group_number: group_number, plan_name: plan_name, plan_type: plan_type, insurance_type: insurance_type,
              additional_properties: struct)
        end

        # Serialize an instance of InsuranceCardBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "group_number": @group_number,
            "plan_name": @plan_name,
            "plan_type": @plan_type,
            "insurance_type": @insurance_type
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
          obj.plan_name&.is_a?(String) != false || raise("Passed value for field obj.plan_name is not the expected type, validation failed.")
          obj.plan_type&.is_a?(Commons::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
          obj.insurance_type&.is_a?(Commons::InsuranceTypeCode) != false || raise("Passed value for field obj.insurance_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
