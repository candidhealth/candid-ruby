# frozen_string_literal: true

require_relative "occurrence_span_code_qualifier"
require_relative "occurrence_span_code"
require_relative "rd_8_date"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BI code qualifier value.
        class OccurrenceSpanInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCodeQualifier]
          attr_reader :occurrence_span_code_qualifier
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCode]
          attr_reader :occurrence_span_code
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date]
          attr_reader :occurrence_span_date
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

          # @param occurrence_span_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCodeQualifier]
          # @param occurrence_span_code [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCode]
          # @param occurrence_span_date [CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date]
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
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation]
          def initialize(occurrence_span_code_qualifier:, occurrence_span_code:, occurrence_span_date:, id: OMIT,
                         encounter_id: OMIT, additional_properties: nil)
            @occurrence_span_code_qualifier = occurrence_span_code_qualifier
            @occurrence_span_code = occurrence_span_code
            @occurrence_span_date = occurrence_span_date
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "occurrence_span_code_qualifier": occurrence_span_code_qualifier,
              "occurrence_span_code": occurrence_span_code,
              "occurrence_span_date": occurrence_span_date,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of OccurrenceSpanInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            occurrence_span_code_qualifier = struct["occurrence_span_code_qualifier"]
            occurrence_span_code = struct["occurrence_span_code"]
            if parsed_json["occurrence_span_date"].nil?
              occurrence_span_date = nil
            else
              occurrence_span_date = parsed_json["occurrence_span_date"].to_json
              occurrence_span_date = CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date.from_json(json_object: occurrence_span_date)
            end
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              occurrence_span_code_qualifier: occurrence_span_code_qualifier,
              occurrence_span_code: occurrence_span_code,
              occurrence_span_date: occurrence_span_date,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of OccurrenceSpanInformation to a JSON object
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
            obj.occurrence_span_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCodeQualifier) != false || raise("Passed value for field obj.occurrence_span_code_qualifier is not the expected type, validation failed.")
            obj.occurrence_span_code.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanCode) != false || raise("Passed value for field obj.occurrence_span_code is not the expected type, validation failed.")
            CandidApiClient::HealthCareCodeInformation::V1::Types::Rd8Date.validate_raw(obj: obj.occurrence_span_date)
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
