# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class IntakeFollowUp
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :text
          # @return [String]
          attr_reader :response
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param text [String]
          # @param response [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::IntakeFollowUp]
          def initialize(id:, text:, response: OMIT, additional_properties: nil)
            @id = id
            @text = text
            @response = response if response != OMIT
            @additional_properties = additional_properties
            @_field_set = { "id": id, "text": text, "response": response }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of IntakeFollowUp
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::IntakeFollowUp]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            id = struct["id"]
            text = struct["text"]
            response = struct["response"]
            new(
              id: id,
              text: text,
              response: response,
              additional_properties: struct
            )
          end

          # Serialize an instance of IntakeFollowUp to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
            obj.response&.is_a?(String) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
