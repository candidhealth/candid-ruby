# frozen_string_literal: true

require_relative "coverage_type"
require_relative "../../../../common/types/period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Coverages
          module Types
            class InsurancePlan
              # @return [String]
              attr_reader :member_id
              # @return [String]
              attr_reader :payer_id
              # @return [String]
              attr_reader :payer_name
              # @return [String]
              attr_reader :group_number
              # @return [String]
              attr_reader :name
              # @return [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::CoverageType]
              attr_reader :type
              # @return [CandidApiClient::PreEncounter::Common::Types::Period]
              attr_reader :period
              # @return [String]
              attr_reader :insurance_card_image_locator
              # @return [OpenStruct] Additional properties unmapped to the current class definition
              attr_reader :additional_properties
              # @return [Object]
              attr_reader :_field_set
              protected :_field_set

              OMIT = Object.new

              # @param member_id [String]
              # @param payer_id [String]
              # @param payer_name [String]
              # @param group_number [String]
              # @param name [String]
              # @param type [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::CoverageType]
              # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
              # @param insurance_card_image_locator [String]
              # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
              # @return [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::InsurancePlan]
              def initialize(member_id:, payer_id:, payer_name:, group_number: OMIT, name: OMIT, type: OMIT,
                             period: OMIT, insurance_card_image_locator: OMIT, additional_properties: nil)
                @member_id = member_id
                @payer_id = payer_id
                @payer_name = payer_name
                @group_number = group_number if group_number != OMIT
                @name = name if name != OMIT
                @type = type if type != OMIT
                @period = period if period != OMIT
                @insurance_card_image_locator = insurance_card_image_locator if insurance_card_image_locator != OMIT
                @additional_properties = additional_properties
                @_field_set = {
                  "member_id": member_id,
                  "payer_id": payer_id,
                  "payer_name": payer_name,
                  "group_number": group_number,
                  "name": name,
                  "type": type,
                  "period": period,
                  "insurance_card_image_locator": insurance_card_image_locator
                }.reject do |_k, v|
                  v == OMIT
                end
              end

              # Deserialize a JSON object to an instance of InsurancePlan
              #
              # @param json_object [String]
              # @return [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::InsurancePlan]
              def self.from_json(json_object:)
                struct = JSON.parse(json_object, object_class: OpenStruct)
                parsed_json = JSON.parse(json_object)
                member_id = struct["member_id"]
                payer_id = struct["payer_id"]
                payer_name = struct["payer_name"]
                group_number = struct["group_number"]
                name = struct["name"]
                type = struct["type"]
                if parsed_json["period"].nil?
                  period = nil
                else
                  period = parsed_json["period"].to_json
                  period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
                end
                insurance_card_image_locator = struct["insurance_card_image_locator"]
                new(
                  member_id: member_id,
                  payer_id: payer_id,
                  payer_name: payer_name,
                  group_number: group_number,
                  name: name,
                  type: type,
                  period: period,
                  insurance_card_image_locator: insurance_card_image_locator,
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
                obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
                obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
                obj.type&.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::CoverageType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
                obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
                obj.insurance_card_image_locator&.is_a?(String) != false || raise("Passed value for field obj.insurance_card_image_locator is not the expected type, validation failed.")
              end
            end
          end
        end
      end
    end
  end
end
