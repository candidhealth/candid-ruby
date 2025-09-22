# frozen_string_literal: true

require_relative "occurrence_information_code_qualifier"
require_relative "occurrence_code"
require "date"
require_relative "code_list_qualifier_code"
require_relative "date_time_period_format_qualifier"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BH code qualifier value.
        class OccurrenceInformationNew
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationCodeQualifier]
          attr_reader :occurrence_code_qualifier
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceCode]
          attr_reader :occurrence_code
          # @return [DateTime]
          attr_reader :occurrence_date
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

          # @param occurrence_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationCodeQualifier]
          # @param occurrence_code [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceCode]
          # @param occurrence_date [DateTime]
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
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew]
          def initialize(occurrence_code_qualifier:, occurrence_code:, occurrence_date:, code_list_qualifier: OMIT,
                         industry_code_1: OMIT, industry_code_2: OMIT, industry_code_3: OMIT, industry_code_4: OMIT, date_time_period_format_qualifier: OMIT, date_time_period: OMIT, monetary_amount: OMIT, quantity: OMIT, additional_properties: nil)
            @occurrence_code_qualifier = occurrence_code_qualifier
            @occurrence_code = occurrence_code
            @occurrence_date = occurrence_date
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
              "occurrence_code_qualifier": occurrence_code_qualifier,
              "occurrence_code": occurrence_code,
              "occurrence_date": occurrence_date,
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

          # Deserialize a JSON object to an instance of OccurrenceInformationNew
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            occurrence_code_qualifier = struct["occurrence_code_qualifier"]
            occurrence_code = struct["occurrence_code"]
            occurrence_date = unless parsed_json["occurrence_date"].nil?
                                DateTime.parse(parsed_json["occurrence_date"])
                              end
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
              occurrence_code_qualifier: occurrence_code_qualifier,
              occurrence_code: occurrence_code,
              occurrence_date: occurrence_date,
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

          # Serialize an instance of OccurrenceInformationNew to a JSON object
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
            obj.occurrence_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationCodeQualifier) != false || raise("Passed value for field obj.occurrence_code_qualifier is not the expected type, validation failed.")
            obj.occurrence_code.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceCode) != false || raise("Passed value for field obj.occurrence_code is not the expected type, validation failed.")
            obj.occurrence_date.is_a?(DateTime) != false || raise("Passed value for field obj.occurrence_date is not the expected type, validation failed.")
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
