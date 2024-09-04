# frozen_string_literal: true

require "date"
require_relative "eligibility_status"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanMetadata
            # @return [String]
            attr_reader :insurance_type
            # @return [String]
            attr_reader :insurance_type_code
            # @return [String]
            attr_reader :plan_name
            # @return [String]
            attr_reader :member_id
            # @return [String]
            attr_reader :group_number
            # @return [Date]
            attr_reader :start_date
            # @return [Date]
            attr_reader :end_date
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus]
            attr_reader :eligibility_status
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param insurance_type [String]
            # @param insurance_type_code [String]
            # @param plan_name [String]
            # @param member_id [String]
            # @param group_number [String]
            # @param start_date [Date]
            # @param end_date [Date]
            # @param eligibility_status [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata]
            def initialize(insurance_type: OMIT, insurance_type_code: OMIT, plan_name: OMIT, member_id: OMIT,
                           group_number: OMIT, start_date: OMIT, end_date: OMIT, eligibility_status: OMIT, additional_properties: nil)
              @insurance_type = insurance_type if insurance_type != OMIT
              @insurance_type_code = insurance_type_code if insurance_type_code != OMIT
              @plan_name = plan_name if plan_name != OMIT
              @member_id = member_id if member_id != OMIT
              @group_number = group_number if group_number != OMIT
              @start_date = start_date if start_date != OMIT
              @end_date = end_date if end_date != OMIT
              @eligibility_status = eligibility_status if eligibility_status != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "insurance_type": insurance_type,
                "insurance_type_code": insurance_type_code,
                "plan_name": plan_name,
                "member_id": member_id,
                "group_number": group_number,
                "start_date": start_date,
                "end_date": end_date,
                "eligibility_status": eligibility_status
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PlanMetadata
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              insurance_type = struct["insurance_type"]
              insurance_type_code = struct["insurance_type_code"]
              plan_name = struct["plan_name"]
              member_id = struct["member_id"]
              group_number = struct["group_number"]
              start_date = (Date.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
              end_date = (Date.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
              eligibility_status = struct["eligibility_status"]
              new(
                insurance_type: insurance_type,
                insurance_type_code: insurance_type_code,
                plan_name: plan_name,
                member_id: member_id,
                group_number: group_number,
                start_date: start_date,
                end_date: end_date,
                eligibility_status: eligibility_status,
                additional_properties: struct
              )
            end

            # Serialize an instance of PlanMetadata to a JSON object
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
              obj.insurance_type&.is_a?(String) != false || raise("Passed value for field obj.insurance_type is not the expected type, validation failed.")
              obj.insurance_type_code&.is_a?(String) != false || raise("Passed value for field obj.insurance_type_code is not the expected type, validation failed.")
              obj.plan_name&.is_a?(String) != false || raise("Passed value for field obj.plan_name is not the expected type, validation failed.")
              obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
              obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
              obj.start_date&.is_a?(Date) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
              obj.end_date&.is_a?(Date) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
              obj.eligibility_status&.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus) != false || raise("Passed value for field obj.eligibility_status is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
