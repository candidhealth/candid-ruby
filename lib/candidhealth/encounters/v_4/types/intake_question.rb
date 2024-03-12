# frozen_string_literal: true

require_relative "intake_question_id"
require_relative "intake_response_and_follow_ups"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class IntakeQuestion
        attr_reader :id, :text, :responses, :additional_properties

        # @param id [Encounters::V4::INTAKE_QUESTION_ID]
        # @param text [String]
        # @param responses [Array<Encounters::V4::IntakeResponseAndFollowUps>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::IntakeQuestion]
        def initialize(id:, text:, responses: nil, additional_properties: nil)
          # @type [Encounters::V4::INTAKE_QUESTION_ID]
          @id = id
          # @type [String]
          @text = text
          # @type [Array<Encounters::V4::IntakeResponseAndFollowUps>]
          @responses = responses
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of IntakeQuestion
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::IntakeQuestion]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          id = struct.id
          text = struct.text
          responses = parsed_json["responses"]&.map do |v|
            v = v.to_json
            Encounters::V4::IntakeResponseAndFollowUps.from_json(json_object: v)
          end
          new(id: id, text: text, responses: responses, additional_properties: struct)
        end

        # Serialize an instance of IntakeQuestion to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "id": @id, "text": @text, "responses": @responses }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
          obj.responses&.is_a?(Array) != false || raise("Passed value for field obj.responses is not the expected type, validation failed.")
        end
      end
    end
  end
end
