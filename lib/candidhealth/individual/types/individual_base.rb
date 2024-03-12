# frozen_string_literal: true

require_relative "gender"
require "json"

module CandidApiClient
  class Individual
    class IndividualBase
      attr_reader :first_name, :last_name, :gender, :additional_properties

      # @param first_name [String]
      # @param last_name [String]
      # @param gender [Individual::Gender]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Individual::IndividualBase]
      def initialize(first_name:, last_name:, gender:, additional_properties: nil)
        # @type [String]
        @first_name = first_name
        # @type [String]
        @last_name = last_name
        # @type [Individual::Gender]
        @gender = gender
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IndividualBase
      #
      # @param json_object [JSON]
      # @return [Individual::IndividualBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        first_name = struct.first_name
        last_name = struct.last_name
        gender = struct.gender
        new(first_name: first_name, last_name: last_name, gender: gender, additional_properties: struct)
      end

      # Serialize an instance of IndividualBase to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "first_name": @first_name, "last_name": @last_name, "gender": @gender }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.gender.is_a?(Individual::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
      end
    end
  end
end
