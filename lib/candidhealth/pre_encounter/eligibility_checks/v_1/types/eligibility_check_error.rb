# frozen_string_literal: true

require_relative "eligibility_check_error_source"
require_relative "eligibility_check_error_details"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheckError
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorSource]
            attr_reader :source
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails]
            attr_reader :error_details
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param source [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorSource]
            # @param error_details [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckError]
            def initialize(source:, error_details:, additional_properties: nil)
              @source = source
              @error_details = error_details
              @additional_properties = additional_properties
              @_field_set = { "source": source, "errorDetails": error_details }
            end

            # Deserialize a JSON object to an instance of EligibilityCheckError
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckError]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              source = struct["source"]
              if parsed_json["errorDetails"].nil?
                error_details = nil
              else
                error_details = parsed_json["errorDetails"].to_json
                error_details = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails.from_json(json_object: error_details)
              end
              new(
                source: source,
                error_details: error_details,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityCheckError to a JSON object
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
              obj.source.is_a?(CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails.validate_raw(obj: obj.error_details)
            end
          end
        end
      end
    end
  end
end
