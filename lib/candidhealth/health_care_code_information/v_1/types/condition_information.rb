# frozen_string_literal: true

require_relative "condition_information_code_qualifier"
require_relative "condition_code"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BG code qualifier value.
        class ConditionInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationCodeQualifier]
          attr_reader :condition_code_qualifier
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionCode]
          attr_reader :condition_code
          # @return [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          attr_reader :id
          # @return [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          attr_reader :encounter_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param condition_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationCodeQualifier]
          # @param condition_code [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionCode]
          # @param id [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          # @param encounter_id [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation]
          def initialize(condition_code_qualifier:, condition_code:, id: OMIT, encounter_id: OMIT,
                         additional_properties: nil)
            @condition_code_qualifier = condition_code_qualifier
            @condition_code = condition_code
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "condition_code_qualifier": condition_code_qualifier,
              "condition_code": condition_code,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ConditionInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            condition_code_qualifier = struct["condition_code_qualifier"]
            condition_code = struct["condition_code"]
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              condition_code_qualifier: condition_code_qualifier,
              condition_code: condition_code,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ConditionInformation to a JSON object
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
            obj.condition_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationCodeQualifier) != false || raise("Passed value for field obj.condition_code_qualifier is not the expected type, validation failed.")
            obj.condition_code.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionCode) != false || raise("Passed value for field obj.condition_code is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
