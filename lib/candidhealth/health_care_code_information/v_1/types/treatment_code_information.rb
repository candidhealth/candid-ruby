# frozen_string_literal: true

require_relative "treatment_code_qualifier"
require_relative "code_list_qualifier_code"
require_relative "date_time_period_format_qualifier"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the TC code qualifier value.
        class TreatmentCodeInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeQualifier]
          attr_reader :treatment_code_qualifier
          # @return [String]
          attr_reader :treatment_code
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
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode]
          attr_reader :code_list_qualifier
          # @return [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :industry_code_1
          # @return [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :industry_code_2
          # @return [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :industry_code_3
          # @return [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :industry_code_4
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier] Controls how the date_time_period field is interpreted and is submitted
          #  as part of claim process.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :date_time_period_format_qualifier
          # @return [String] A string, formatted according to date_time_period_format_qualifier, which
          #  ultimately represents the date time period in which an information object
          #  is covering.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :date_time_period
          # @return [String] A decimal used to represent ValueInformation results.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :monetary_amount
          # @return [String] You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          attr_reader :quantity
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param treatment_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeQualifier]
          # @param treatment_code [String]
          # @param id [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          # @param encounter_id [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          # @param code_list_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode]
          # @param industry_code_1 [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param industry_code_2 [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param industry_code_3 [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param industry_code_4 [String] A code string whose interpretation depends on the code_list_qualifier being set.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param date_time_period_format_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier] Controls how the date_time_period field is interpreted and is submitted
          #  as part of claim process.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param date_time_period [String] A string, formatted according to date_time_period_format_qualifier, which
          #  ultimately represents the date time period in which an information object
          #  is covering.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param monetary_amount [String] A decimal used to represent ValueInformation results.
          #  You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param quantity [String] You do not need to set this field generally, instead it is provided as advisory
          #  context on how this HealthCareCodeInformation's data will be available in
          #  reporting.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation]
          def initialize(treatment_code_qualifier:, treatment_code:, id: OMIT, encounter_id: OMIT,
                         code_list_qualifier: OMIT, industry_code_1: OMIT, industry_code_2: OMIT, industry_code_3: OMIT, industry_code_4: OMIT, date_time_period_format_qualifier: OMIT, date_time_period: OMIT, monetary_amount: OMIT, quantity: OMIT, additional_properties: nil)
            @treatment_code_qualifier = treatment_code_qualifier
            @treatment_code = treatment_code
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @code_list_qualifier = code_list_qualifier if code_list_qualifier != OMIT
            @industry_code_1 = industry_code_1 if industry_code_1 != OMIT
            @industry_code_2 = industry_code_2 if industry_code_2 != OMIT
            @industry_code_3 = industry_code_3 if industry_code_3 != OMIT
            @industry_code_4 = industry_code_4 if industry_code_4 != OMIT
            if date_time_period_format_qualifier != OMIT
              @date_time_period_format_qualifier = date_time_period_format_qualifier
            end
            @date_time_period = date_time_period if date_time_period != OMIT
            @monetary_amount = monetary_amount if monetary_amount != OMIT
            @quantity = quantity if quantity != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "treatment_code_qualifier": treatment_code_qualifier,
              "treatment_code": treatment_code,
              "id": id,
              "encounter_id": encounter_id,
              "code_list_qualifier": code_list_qualifier,
              "industry_code_1": industry_code_1,
              "industry_code_2": industry_code_2,
              "industry_code_3": industry_code_3,
              "industry_code_4": industry_code_4,
              "date_time_period_format_qualifier": date_time_period_format_qualifier,
              "date_time_period": date_time_period,
              "monetary_amount": monetary_amount,
              "quantity": quantity
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TreatmentCodeInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            treatment_code_qualifier = struct["treatment_code_qualifier"]
            treatment_code = struct["treatment_code"]
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            code_list_qualifier = struct["code_list_qualifier"]
            industry_code_1 = struct["industry_code_1"]
            industry_code_2 = struct["industry_code_2"]
            industry_code_3 = struct["industry_code_3"]
            industry_code_4 = struct["industry_code_4"]
            date_time_period_format_qualifier = struct["date_time_period_format_qualifier"]
            date_time_period = struct["date_time_period"]
            monetary_amount = struct["monetary_amount"]
            quantity = struct["quantity"]
            new(
              treatment_code_qualifier: treatment_code_qualifier,
              treatment_code: treatment_code,
              id: id,
              encounter_id: encounter_id,
              code_list_qualifier: code_list_qualifier,
              industry_code_1: industry_code_1,
              industry_code_2: industry_code_2,
              industry_code_3: industry_code_3,
              industry_code_4: industry_code_4,
              date_time_period_format_qualifier: date_time_period_format_qualifier,
              date_time_period: date_time_period,
              monetary_amount: monetary_amount,
              quantity: quantity,
              additional_properties: struct
            )
          end

          # Serialize an instance of TreatmentCodeInformation to a JSON object
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
            obj.treatment_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeQualifier) != false || raise("Passed value for field obj.treatment_code_qualifier is not the expected type, validation failed.")
            obj.treatment_code.is_a?(String) != false || raise("Passed value for field obj.treatment_code is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.code_list_qualifier&.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode) != false || raise("Passed value for field obj.code_list_qualifier is not the expected type, validation failed.")
            obj.industry_code_1&.is_a?(String) != false || raise("Passed value for field obj.industry_code_1 is not the expected type, validation failed.")
            obj.industry_code_2&.is_a?(String) != false || raise("Passed value for field obj.industry_code_2 is not the expected type, validation failed.")
            obj.industry_code_3&.is_a?(String) != false || raise("Passed value for field obj.industry_code_3 is not the expected type, validation failed.")
            obj.industry_code_4&.is_a?(String) != false || raise("Passed value for field obj.industry_code_4 is not the expected type, validation failed.")
            obj.date_time_period_format_qualifier&.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier) != false || raise("Passed value for field obj.date_time_period_format_qualifier is not the expected type, validation failed.")
            obj.date_time_period&.is_a?(String) != false || raise("Passed value for field obj.date_time_period is not the expected type, validation failed.")
            obj.monetary_amount&.is_a?(String) != false || raise("Passed value for field obj.monetary_amount is not the expected type, validation failed.")
            obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
