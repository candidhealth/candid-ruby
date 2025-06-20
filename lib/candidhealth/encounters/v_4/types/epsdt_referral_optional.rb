# frozen_string_literal: true

require_relative "../../../commons/types/epsdt_referral_condition_indicator_code"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class EpsdtReferralOptional
          # @return [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          attr_reader :condition_indicator_1
          # @return [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          attr_reader :condition_indicator_2
          # @return [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          attr_reader :condition_indicator_3
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param condition_indicator_1 [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          # @param condition_indicator_2 [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          # @param condition_indicator_3 [CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::EpsdtReferralOptional]
          def initialize(condition_indicator_1: OMIT, condition_indicator_2: OMIT, condition_indicator_3: OMIT,
                         additional_properties: nil)
            @condition_indicator_1 = condition_indicator_1 if condition_indicator_1 != OMIT
            @condition_indicator_2 = condition_indicator_2 if condition_indicator_2 != OMIT
            @condition_indicator_3 = condition_indicator_3 if condition_indicator_3 != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "condition_indicator1": condition_indicator_1,
              "condition_indicator2": condition_indicator_2,
              "condition_indicator3": condition_indicator_3
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of EpsdtReferralOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::EpsdtReferralOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            condition_indicator_1 = struct["condition_indicator1"]
            condition_indicator_2 = struct["condition_indicator2"]
            condition_indicator_3 = struct["condition_indicator3"]
            new(
              condition_indicator_1: condition_indicator_1,
              condition_indicator_2: condition_indicator_2,
              condition_indicator_3: condition_indicator_3,
              additional_properties: struct
            )
          end

          # Serialize an instance of EpsdtReferralOptional to a JSON object
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
            obj.condition_indicator_1&.is_a?(CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode) != false || raise("Passed value for field obj.condition_indicator_1 is not the expected type, validation failed.")
            obj.condition_indicator_2&.is_a?(CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode) != false || raise("Passed value for field obj.condition_indicator_2 is not the expected type, validation failed.")
            obj.condition_indicator_3&.is_a?(CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode) != false || raise("Passed value for field obj.condition_indicator_3 is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
