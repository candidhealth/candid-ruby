# frozen_string_literal: true

require_relative "intake_response_and_follow_ups"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class IntakeQuestionOptional
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :text
          # @return [Array<CandidApiClient::Encounters::V4::Types::IntakeResponseAndFollowUps>]
          attr_reader :responses
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param text [String]
          # @param responses [Array<CandidApiClient::Encounters::V4::Types::IntakeResponseAndFollowUps>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::IntakeQuestionOptional]
          def initialize(id: OMIT, text: OMIT, responses: OMIT, additional_properties: nil)
            @id = id if id != OMIT
            @text = text if text != OMIT
            @responses = responses if responses != OMIT
            @additional_properties = additional_properties
            @_field_set = { "id": id, "text": text, "responses": responses }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of IntakeQuestionOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::IntakeQuestionOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            text = struct["text"]
            responses = parsed_json["responses"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::IntakeResponseAndFollowUps.from_json(json_object: item)
            end
            new(
              id: id,
              text: text,
              responses: responses,
              additional_properties: struct
            )
          end

          # Serialize an instance of IntakeQuestionOptional to a JSON object
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
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
            obj.responses&.is_a?(Array) != false || raise("Passed value for field obj.responses is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
