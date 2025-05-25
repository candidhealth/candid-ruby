# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for a batch eligibility response.
          class BatchEligibilityResponse
            # @return [String]
            attr_reader :batch_id
            # @return [DateTime]
            attr_reader :submitted_at
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param batch_id [String]
            # @param submitted_at [DateTime]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
            def initialize(batch_id:, submitted_at:, additional_properties: nil)
              @batch_id = batch_id
              @submitted_at = submitted_at
              @additional_properties = additional_properties
              @_field_set = { "batch_id": batch_id, "submitted_at": submitted_at }
            end

            # Deserialize a JSON object to an instance of BatchEligibilityResponse
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              batch_id = struct["batch_id"]
              submitted_at = (DateTime.parse(parsed_json["submitted_at"]) unless parsed_json["submitted_at"].nil?)
              new(
                batch_id: batch_id,
                submitted_at: submitted_at,
                additional_properties: struct
              )
            end

            # Serialize an instance of BatchEligibilityResponse to a JSON object
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
              obj.batch_id.is_a?(String) != false || raise("Passed value for field obj.batch_id is not the expected type, validation failed.")
              obj.submitted_at.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
