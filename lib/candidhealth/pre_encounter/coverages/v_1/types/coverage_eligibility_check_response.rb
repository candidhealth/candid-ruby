# frozen_string_literal: true

require_relative "eligibility_check_metadata"
require_relative "eligibility_check"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageEligibilityCheckResponse
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata]
            attr_reader :metadata
            # @return [String]
            attr_reader :error
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheck]
            attr_reader :check
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param metadata [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata]
            # @param error [String]
            # @param check [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheck]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
            def initialize(metadata:, error: OMIT, check: OMIT, additional_properties: nil)
              @metadata = metadata
              @error = error if error != OMIT
              @check = check if check != OMIT
              @additional_properties = additional_properties
              @_field_set = { "metadata": metadata, "error": error, "check": check }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of CoverageEligibilityCheckResponse
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["metadata"].nil?
                metadata = nil
              else
                metadata = parsed_json["metadata"].to_json
                metadata = CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata.from_json(json_object: metadata)
              end
              error = struct["error"]
              if parsed_json["check"].nil?
                check = nil
              else
                check = parsed_json["check"].to_json
                check = CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheck.from_json(json_object: check)
              end
              new(
                metadata: metadata,
                error: error,
                check: check,
                additional_properties: struct
              )
            end

            # Serialize an instance of CoverageEligibilityCheckResponse to a JSON object
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
              CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata.validate_raw(obj: obj.metadata)
              obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
              obj.check.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheck.validate_raw(obj: obj.check)
            end
          end
        end
      end
    end
  end
end
