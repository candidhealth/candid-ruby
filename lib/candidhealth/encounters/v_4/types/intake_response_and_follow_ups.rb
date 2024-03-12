# frozen_string_literal: true

require_relative "intake_follow_up"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class IntakeResponseAndFollowUps
        attr_reader :response, :follow_ups, :additional_properties

        # @param response [String]
        # @param follow_ups [Array<Encounters::V4::IntakeFollowUp>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::IntakeResponseAndFollowUps]
        def initialize(response: nil, follow_ups: nil, additional_properties: nil)
          # @type [String]
          @response = response
          # @type [Array<Encounters::V4::IntakeFollowUp>]
          @follow_ups = follow_ups
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of IntakeResponseAndFollowUps
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::IntakeResponseAndFollowUps]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          response = struct.response
          follow_ups = parsed_json["follow_ups"]&.map do |v|
            v = v.to_json
            Encounters::V4::IntakeFollowUp.from_json(json_object: v)
          end
          new(response: response, follow_ups: follow_ups, additional_properties: struct)
        end

        # Serialize an instance of IntakeResponseAndFollowUps to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "response": @response, "follow_ups": @follow_ups }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.response&.is_a?(String) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
          obj.follow_ups&.is_a?(Array) != false || raise("Passed value for field obj.follow_ups is not the expected type, validation failed.")
        end
      end
    end
  end
end
