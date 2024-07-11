# frozen_string_literal: true

require_relative "tag_color_enum"
require "ostruct"
require "json"

module CandidApiClient
  module Tags
    module Types
      class Tag
        # @return [String]
        attr_reader :creator_id
        # @return [String]
        attr_reader :tag_id
        # @return [String]
        attr_reader :description
        # @return [CandidApiClient::Tags::Types::TagColorEnum]
        attr_reader :color
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param creator_id [String]
        # @param tag_id [String]
        # @param description [String]
        # @param color [CandidApiClient::Tags::Types::TagColorEnum]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Tags::Types::Tag]
        def initialize(creator_id:, tag_id:, description:, color:, additional_properties: nil)
          @creator_id = creator_id
          @tag_id = tag_id
          @description = description
          @color = color
          @additional_properties = additional_properties
          @_field_set = { "creator_id": creator_id, "tag_id": tag_id, "description": description, "color": color }
        end

        # Deserialize a JSON object to an instance of Tag
        #
        # @param json_object [String]
        # @return [CandidApiClient::Tags::Types::Tag]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          creator_id = struct["creator_id"]
          tag_id = struct["tag_id"]
          description = struct["description"]
          color = struct["color"]
          new(
            creator_id: creator_id,
            tag_id: tag_id,
            description: description,
            color: color,
            additional_properties: struct
          )
        end

        # Serialize an instance of Tag to a JSON object
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
          obj.creator_id.is_a?(String) != false || raise("Passed value for field obj.creator_id is not the expected type, validation failed.")
          obj.tag_id.is_a?(String) != false || raise("Passed value for field obj.tag_id is not the expected type, validation failed.")
          obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.color.is_a?(CandidApiClient::Tags::Types::TagColorEnum) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        end
      end
    end
  end
end
