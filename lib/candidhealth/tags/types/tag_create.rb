# frozen_string_literal: true

require_relative "tag_color_enum"
require "ostruct"
require "json"

module CandidApiClient
  module Tags
    module Types
      class TagCreate
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

        # @param tag_id [String]
        # @param description [String]
        # @param color [CandidApiClient::Tags::Types::TagColorEnum]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Tags::Types::TagCreate]
        def initialize(tag_id:, description:, color:, additional_properties: nil)
          @tag_id = tag_id
          @description = description
          @color = color
          @additional_properties = additional_properties
          @_field_set = { "tag_id": tag_id, "description": description, "color": color }
        end

        # Deserialize a JSON object to an instance of TagCreate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Tags::Types::TagCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          tag_id = struct["tag_id"]
          description = struct["description"]
          color = struct["color"]
          new(
            tag_id: tag_id,
            description: description,
            color: color,
            additional_properties: struct
          )
        end

        # Serialize an instance of TagCreate to a JSON object
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
          obj.tag_id.is_a?(String) != false || raise("Passed value for field obj.tag_id is not the expected type, validation failed.")
          obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.color.is_a?(CandidApiClient::Tags::Types::TagColorEnum) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        end
      end
    end
  end
end
