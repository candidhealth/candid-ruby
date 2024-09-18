# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanDate
            # @return [Date]
            attr_reader :start_date
            # @return [Date]
            attr_reader :end_date
            # @return [String]
            attr_reader :field_name
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param start_date [Date]
            # @param end_date [Date]
            # @param field_name [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanDate]
            def initialize(start_date:, field_name:, end_date: OMIT, additional_properties: nil)
              @start_date = start_date
              @end_date = end_date if end_date != OMIT
              @field_name = field_name
              @additional_properties = additional_properties
              @_field_set = {
                "start_date": start_date,
                "end_date": end_date,
                "field_name": field_name
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PlanDate
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanDate]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              start_date = (Date.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
              end_date = (Date.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
              field_name = struct["field_name"]
              new(
                start_date: start_date,
                end_date: end_date,
                field_name: field_name,
                additional_properties: struct
              )
            end

            # Serialize an instance of PlanDate to a JSON object
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
              obj.start_date.is_a?(Date) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
              obj.end_date&.is_a?(Date) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
              obj.field_name.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
