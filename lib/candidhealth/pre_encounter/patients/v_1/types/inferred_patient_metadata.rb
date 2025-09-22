# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class InferredPatientMetadata
            # @return [String]
            attr_reader :inferred_encounter_id
            # @return [Date]
            attr_reader :inferred_encounter_latest_date_of_service
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param inferred_encounter_id [String]
            # @param inferred_encounter_latest_date_of_service [Date]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::InferredPatientMetadata]
            def initialize(inferred_encounter_id:, inferred_encounter_latest_date_of_service:,
                           additional_properties: nil)
              @inferred_encounter_id = inferred_encounter_id
              @inferred_encounter_latest_date_of_service = inferred_encounter_latest_date_of_service
              @additional_properties = additional_properties
              @_field_set = {
                "inferred_encounter_id": inferred_encounter_id,
                "inferred_encounter_latest_date_of_service": inferred_encounter_latest_date_of_service
              }
            end

            # Deserialize a JSON object to an instance of InferredPatientMetadata
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::InferredPatientMetadata]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              inferred_encounter_id = struct["inferred_encounter_id"]
              inferred_encounter_latest_date_of_service = unless parsed_json["inferred_encounter_latest_date_of_service"].nil?
                                                            Date.parse(parsed_json["inferred_encounter_latest_date_of_service"])
                                                          end
              new(
                inferred_encounter_id: inferred_encounter_id,
                inferred_encounter_latest_date_of_service: inferred_encounter_latest_date_of_service,
                additional_properties: struct
              )
            end

            # Serialize an instance of InferredPatientMetadata to a JSON object
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
              obj.inferred_encounter_id.is_a?(String) != false || raise("Passed value for field obj.inferred_encounter_id is not the expected type, validation failed.")
              obj.inferred_encounter_latest_date_of_service.is_a?(Date) != false || raise("Passed value for field obj.inferred_encounter_latest_date_of_service is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
