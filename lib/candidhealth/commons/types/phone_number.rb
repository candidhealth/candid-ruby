# frozen_string_literal: true

require_relative "phone_number_type"
require "ostruct"
require "json"

module CandidApiClient
  module Commons
    module Types
      class PhoneNumber
        # @return [String]
        attr_reader :number
        # @return [CandidApiClient::Commons::Types::PhoneNumberType]
        attr_reader :type
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param number [String]
        # @param type [CandidApiClient::Commons::Types::PhoneNumberType]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Commons::Types::PhoneNumber]
        def initialize(number:, type:, additional_properties: nil)
          @number = number
          @type = type
          @additional_properties = additional_properties
          @_field_set = { "number": number, "type": type }
        end

        # Deserialize a JSON object to an instance of PhoneNumber
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::PhoneNumber]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          number = struct["number"]
          type = struct["type"]
          new(
            number: number,
            type: type,
            additional_properties: struct
          )
        end

        # Serialize an instance of PhoneNumber to a JSON object
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
          obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
          obj.type.is_a?(CandidApiClient::Commons::Types::PhoneNumberType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        end
      end
    end
  end
end
