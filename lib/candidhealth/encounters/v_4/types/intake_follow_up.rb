# frozen_string_literal: true

require_relative "intake_follow_up_id"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class IntakeFollowUp
        attr_reader :id, :text, :response, :additional_properties

        # @param id [Encounters::V4::INTAKE_FOLLOW_UP_ID]
        # @param text [String]
        # @param response [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::IntakeFollowUp]
        def initialize(id:, text:, response: nil, additional_properties: nil)
          # @type [Encounters::V4::INTAKE_FOLLOW_UP_ID]
          @id = id
          # @type [String]
          @text = text
          # @type [String]
          @response = response
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of IntakeFollowUp
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::IntakeFollowUp]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          id = struct.id
          text = struct.text
          response = struct.response
          new(id: id, text: text, response: response, additional_properties: struct)
        end

        # Serialize an instance of IntakeFollowUp to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "id": @id, "text": @text, "response": @response }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
          obj.response&.is_a?(String) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
        end
      end
    end
  end
end
