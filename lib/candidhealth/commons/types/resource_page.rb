# frozen_string_literal: true

require_relative "page_token"
require "json"

module CandidApiClient
  class Commons
    class ResourcePage
      attr_reader :prev_page_token, :next_page_token, :additional_properties

      # @param prev_page_token [Commons::PAGE_TOKEN]
      # @param next_page_token [Commons::PAGE_TOKEN]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::ResourcePage]
      def initialize(prev_page_token: nil, next_page_token: nil, additional_properties: nil)
        # @type [Commons::PAGE_TOKEN]
        @prev_page_token = prev_page_token
        # @type [Commons::PAGE_TOKEN]
        @next_page_token = next_page_token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ResourcePage
      #
      # @param json_object [JSON]
      # @return [Commons::ResourcePage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        prev_page_token = struct.prev_page_token
        next_page_token = struct.next_page_token
        new(prev_page_token: prev_page_token, next_page_token: next_page_token, additional_properties: struct)
      end

      # Serialize an instance of ResourcePage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "prev_page_token": @prev_page_token, "next_page_token": @next_page_token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
        obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
      end
    end
  end
end
