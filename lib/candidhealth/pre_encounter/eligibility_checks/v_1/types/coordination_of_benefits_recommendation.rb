# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a Coordination Of Benefits recommendation.
          class CoordinationOfBenefitsRecommendation
            # @return [Object]
            attr_reader :payload
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payload [Object]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation]
            def initialize(payload:, additional_properties: nil)
              @payload = payload
              @additional_properties = additional_properties
              @_field_set = { "payload": payload }
            end

            # Deserialize a JSON object to an instance of CoordinationOfBenefitsRecommendation
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              payload = struct["payload"]
              new(payload: payload, additional_properties: struct)
            end

            # Serialize an instance of CoordinationOfBenefitsRecommendation to a JSON object
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
              obj.payload.is_a?(Object) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
