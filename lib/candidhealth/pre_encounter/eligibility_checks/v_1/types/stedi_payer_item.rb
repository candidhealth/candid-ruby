# frozen_string_literal: true

require_relative "stedi_payer"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class StediPayerItem
            # @return [Integer]
            attr_reader :score
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer]
            attr_reader :payer
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param score [Integer]
            # @param payer [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayerItem]
            def initialize(score:, payer:, additional_properties: nil)
              @score = score
              @payer = payer
              @additional_properties = additional_properties
              @_field_set = { "score": score, "payer": payer }
            end

            # Deserialize a JSON object to an instance of StediPayerItem
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayerItem]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              score = struct["score"]
              if parsed_json["payer"].nil?
                payer = nil
              else
                payer = parsed_json["payer"].to_json
                payer = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer.from_json(json_object: payer)
              end
              new(
                score: score,
                payer: payer,
                additional_properties: struct
              )
            end

            # Serialize an instance of StediPayerItem to a JSON object
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
              obj.score.is_a?(Integer) != false || raise("Passed value for field obj.score is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer.validate_raw(obj: obj.payer)
            end
          end
        end
      end
    end
  end
end
