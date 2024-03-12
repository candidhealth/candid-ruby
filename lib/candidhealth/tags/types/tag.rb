# frozen_string_literal: true

require_relative "tag_id"
require_relative "tag_color_enum"
require "json"

module CandidApiClient
  class Tags
    class Tag
      attr_reader :creator_id, :tag_id, :description, :color, :additional_properties

      # @param creator_id [String]
      # @param tag_id [Tags::TAG_ID]
      # @param description [String]
      # @param color [Tags::TagColorEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tags::Tag]
      def initialize(creator_id:, tag_id:, description:, color:, additional_properties: nil)
        # @type [String]
        @creator_id = creator_id
        # @type [Tags::TAG_ID]
        @tag_id = tag_id
        # @type [String]
        @description = description
        # @type [Tags::TagColorEnum]
        @color = color
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Tag
      #
      # @param json_object [JSON]
      # @return [Tags::Tag]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        creator_id = struct.creator_id
        tag_id = struct.tag_id
        description = struct.description
        color = struct.color
        new(creator_id: creator_id, tag_id: tag_id, description: description, color: color,
            additional_properties: struct)
      end

      # Serialize an instance of Tag to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "creator_id": @creator_id, "tag_id": @tag_id, "description": @description, "color": @color }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.creator_id.is_a?(String) != false || raise("Passed value for field obj.creator_id is not the expected type, validation failed.")
        obj.tag_id.is_a?(String) != false || raise("Passed value for field obj.tag_id is not the expected type, validation failed.")
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.color.is_a?(Tags::TagColorEnum) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
      end
    end
  end
end
