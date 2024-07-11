# frozen_string_literal: true

require_relative "../../../commons/types/source_of_payment_code"
require_relative "../../../commons/types/insurance_type_code"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceCards
    module V2
      module Types
        class InsuranceCardBase
          # @return [String] Box 11 on the CMS-1500 claim form.
          attr_reader :group_number
          # @return [String] Box 11c on the CMS-1500 claim form.
          attr_reader :plan_name
          # @return [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          attr_reader :plan_type
          # @return [CandidApiClient::Commons::Types::InsuranceTypeCode]
          attr_reader :insurance_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param group_number [String] Box 11 on the CMS-1500 claim form.
          # @param plan_name [String] Box 11c on the CMS-1500 claim form.
          # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          # @param insurance_type [CandidApiClient::Commons::Types::InsuranceTypeCode]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceCards::V2::Types::InsuranceCardBase]
          def initialize(group_number: OMIT, plan_name: OMIT, plan_type: OMIT, insurance_type: OMIT,
                         additional_properties: nil)
            @group_number = group_number if group_number != OMIT
            @plan_name = plan_name if plan_name != OMIT
            @plan_type = plan_type if plan_type != OMIT
            @insurance_type = insurance_type if insurance_type != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "group_number": group_number,
              "plan_name": plan_name,
              "plan_type": plan_type,
              "insurance_type": insurance_type
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceCardBase
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceCards::V2::Types::InsuranceCardBase]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            group_number = struct["group_number"]
            plan_name = struct["plan_name"]
            plan_type = struct["plan_type"]
            insurance_type = struct["insurance_type"]
            new(
              group_number: group_number,
              plan_name: plan_name,
              plan_type: plan_type,
              insurance_type: insurance_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceCardBase to a JSON object
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
            obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
            obj.plan_name&.is_a?(String) != false || raise("Passed value for field obj.plan_name is not the expected type, validation failed.")
            obj.plan_type&.is_a?(CandidApiClient::Commons::Types::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
            obj.insurance_type&.is_a?(CandidApiClient::Commons::Types::InsuranceTypeCode) != false || raise("Passed value for field obj.insurance_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
