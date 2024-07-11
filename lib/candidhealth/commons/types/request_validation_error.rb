# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Commons
    module Types
      class RequestValidationError
        # @return [String]
        attr_reader :field_name
        # @return [String]
        attr_reader :human_readable_message
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param field_name [String]
        # @param human_readable_message [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Commons::Types::RequestValidationError]
        def initialize(field_name:, human_readable_message: OMIT, additional_properties: nil)
          @field_name = field_name
          @human_readable_message = human_readable_message if human_readable_message != OMIT
          @additional_properties = additional_properties
          @_field_set = { "fieldName": field_name, "humanReadableMessage": human_readable_message }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of RequestValidationError
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::RequestValidationError]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          field_name = struct["fieldName"]
          human_readable_message = struct["humanReadableMessage"]
          new(
            field_name: field_name,
            human_readable_message: human_readable_message,
            additional_properties: struct
          )
        end

        # Serialize an instance of RequestValidationError to a JSON object
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
          obj.field_name.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
          obj.human_readable_message&.is_a?(String) != false || raise("Passed value for field obj.human_readable_message is not the expected type, validation failed.")
        end
      end
    end
  end
end
