# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Era
    module Types
      class EraBase
        # @return [String]
        attr_reader :check_number
        # @return [String]
        attr_reader :check_date
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param check_number [String]
        # @param check_date [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Era::Types::EraBase]
        def initialize(check_number:, check_date:, additional_properties: nil)
          @check_number = check_number
          @check_date = check_date
          @additional_properties = additional_properties
          @_field_set = { "check_number": check_number, "check_date": check_date }
        end

        # Deserialize a JSON object to an instance of EraBase
        #
        # @param json_object [String]
        # @return [CandidApiClient::Era::Types::EraBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          check_number = struct["check_number"]
          check_date = struct["check_date"]
          new(
            check_number: check_number,
            check_date: check_date,
            additional_properties: struct
          )
        end

        # Serialize an instance of EraBase to a JSON object
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
          obj.check_number.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
          obj.check_date.is_a?(String) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
        end
      end
    end
  end
end
