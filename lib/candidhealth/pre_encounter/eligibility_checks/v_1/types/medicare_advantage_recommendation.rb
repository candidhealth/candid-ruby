# frozen_string_literal: true

require_relative "medicare_advantage_recommendation_payload"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a Medicare Advantage recommendation.
          class MedicareAdvantageRecommendation
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload]
            attr_reader :payload
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payload [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation]
            def initialize(payload:, additional_properties: nil)
              @payload = payload
              @additional_properties = additional_properties
              @_field_set = { "payload": payload }
            end

            # Deserialize a JSON object to an instance of MedicareAdvantageRecommendation
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["payload"].nil?
                payload = nil
              else
                payload = parsed_json["payload"].to_json
                payload = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload.from_json(json_object: payload)
              end
              new(payload: payload, additional_properties: struct)
            end

            # Serialize an instance of MedicareAdvantageRecommendation to a JSON object
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
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload.validate_raw(obj: obj.payload)
            end
          end
        end
      end
    end
  end
end
