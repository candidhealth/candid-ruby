# frozen_string_literal: true

require_relative "value_code_qualifier"
require_relative "value_code"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BE code qualifier value.
        class ValueInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCodeQualifier]
          attr_reader :value_code_qualifier
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCode]
          attr_reader :value_code
          # @return [String]
          attr_reader :value_code_amount
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

          # @param value_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCodeQualifier]
          # @param value_code [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCode]
          # @param value_code_amount [String]
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
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation]
          def initialize(value_code_qualifier:, value_code:, value_code_amount:, id: OMIT, encounter_id: OMIT,
                         additional_properties: nil)
            @value_code_qualifier = value_code_qualifier
            @value_code = value_code
            @value_code_amount = value_code_amount
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "value_code_qualifier": value_code_qualifier,
              "value_code": value_code,
              "value_code_amount": value_code_amount,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ValueInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            value_code_qualifier = struct["value_code_qualifier"]
            value_code = struct["value_code"]
            value_code_amount = struct["value_code_amount"]
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              value_code_qualifier: value_code_qualifier,
              value_code: value_code,
              value_code_amount: value_code_amount,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ValueInformation to a JSON object
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
            obj.value_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCodeQualifier) != false || raise("Passed value for field obj.value_code_qualifier is not the expected type, validation failed.")
            obj.value_code.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::ValueCode) != false || raise("Passed value for field obj.value_code is not the expected type, validation failed.")
            obj.value_code_amount.is_a?(String) != false || raise("Passed value for field obj.value_code_amount is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
