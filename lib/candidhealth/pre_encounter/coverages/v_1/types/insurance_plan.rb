# frozen_string_literal: true

require_relative "../../../common/types/additional_payer_information"
require_relative "network_type"
require_relative "insurance_type_code"
require_relative "../../../common/types/period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class InsurancePlan
            # @return [String]
            attr_reader :member_id
            # @return [String]
            attr_reader :payer_id
            # @return [String]
            attr_reader :payer_name
            # @return [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
            attr_reader :additional_payer_information
            # @return [String]
            attr_reader :group_number
            # @return [String]
            attr_reader :name
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType]
            attr_reader :plan_type
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode]
            attr_reader :type
            # @return [CandidApiClient::PreEncounter::Common::Types::Period]
            attr_reader :period
            # @return [String]
            attr_reader :insurance_card_image_locator
            # @return [String] The ID of the Candid configured payer plan group associated with this coverage
            attr_reader :payer_plan_group_id
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param member_id [String]
            # @param payer_id [String]
            # @param payer_name [String]
            # @param additional_payer_information [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
            # @param group_number [String]
            # @param name [String]
            # @param plan_type [CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType]
            # @param type [CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode]
            # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
            # @param insurance_card_image_locator [String]
            # @param payer_plan_group_id [String] The ID of the Candid configured payer plan group associated with this coverage
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            def initialize(member_id:, payer_id:, payer_name:, additional_payer_information: OMIT, group_number: OMIT,
                           name: OMIT, plan_type: OMIT, type: OMIT, period: OMIT, insurance_card_image_locator: OMIT, payer_plan_group_id: OMIT, additional_properties: nil)
              @member_id = member_id
              @payer_id = payer_id
              @payer_name = payer_name
              @additional_payer_information = additional_payer_information if additional_payer_information != OMIT
              @group_number = group_number if group_number != OMIT
              @name = name if name != OMIT
              @plan_type = plan_type if plan_type != OMIT
              @type = type if type != OMIT
              @period = period if period != OMIT
              @insurance_card_image_locator = insurance_card_image_locator if insurance_card_image_locator != OMIT
              @payer_plan_group_id = payer_plan_group_id if payer_plan_group_id != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "member_id": member_id,
                "payer_id": payer_id,
                "payer_name": payer_name,
                "additional_payer_information": additional_payer_information,
                "group_number": group_number,
                "name": name,
                "plan_type": plan_type,
                "type": type,
                "period": period,
                "insurance_card_image_locator": insurance_card_image_locator,
                "payer_plan_group_id": payer_plan_group_id
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of InsurancePlan
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              member_id = struct["member_id"]
              payer_id = struct["payer_id"]
              payer_name = struct["payer_name"]
              if parsed_json["additional_payer_information"].nil?
                additional_payer_information = nil
              else
                additional_payer_information = parsed_json["additional_payer_information"].to_json
                additional_payer_information = CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation.from_json(json_object: additional_payer_information)
              end
              group_number = struct["group_number"]
              name = struct["name"]
              plan_type = struct["plan_type"]
              type = struct["type"]
              if parsed_json["period"].nil?
                period = nil
              else
                period = parsed_json["period"].to_json
                period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
              end
              insurance_card_image_locator = struct["insurance_card_image_locator"]
              payer_plan_group_id = struct["payer_plan_group_id"]
              new(
                member_id: member_id,
                payer_id: payer_id,
                payer_name: payer_name,
                additional_payer_information: additional_payer_information,
                group_number: group_number,
                name: name,
                plan_type: plan_type,
                type: type,
                period: period,
                insurance_card_image_locator: insurance_card_image_locator,
                payer_plan_group_id: payer_plan_group_id,
                additional_properties: struct
              )
            end

            # Serialize an instance of InsurancePlan to a JSON object
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
              obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
              obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
              obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
              obj.additional_payer_information.nil? || CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation.validate_raw(obj: obj.additional_payer_information)
              obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
              obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
              obj.plan_type&.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
              obj.type&.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::InsuranceTypeCode) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
              obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
              obj.insurance_card_image_locator&.is_a?(String) != false || raise("Passed value for field obj.insurance_card_image_locator is not the expected type, validation failed.")
              obj.payer_plan_group_id&.is_a?(String) != false || raise("Passed value for field obj.payer_plan_group_id is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
