# frozen_string_literal: true

require_relative "intake_follow_up"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class IntakeResponseAndFollowUps
          # @return [String]
          attr_reader :response
          # @return [Array<CandidApiClient::Encounters::V4::Types::IntakeFollowUp>]
          attr_reader :follow_ups
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param response [String]
          # @param follow_ups [Array<CandidApiClient::Encounters::V4::Types::IntakeFollowUp>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::IntakeResponseAndFollowUps]
          def initialize(response: OMIT, follow_ups: OMIT, additional_properties: nil)
            @response = response if response != OMIT
            @follow_ups = follow_ups if follow_ups != OMIT
            @additional_properties = additional_properties
            @_field_set = { "response": response, "follow_ups": follow_ups }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of IntakeResponseAndFollowUps
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::IntakeResponseAndFollowUps]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            response = struct["response"]
            follow_ups = parsed_json["follow_ups"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::IntakeFollowUp.from_json(json_object: item)
            end
            new(
              response: response,
              follow_ups: follow_ups,
              additional_properties: struct
            )
          end

          # Serialize an instance of IntakeResponseAndFollowUps to a JSON object
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
            obj.response&.is_a?(String) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
            obj.follow_ups&.is_a?(Array) != false || raise("Passed value for field obj.follow_ups is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
