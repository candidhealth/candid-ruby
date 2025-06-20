# frozen_string_literal: true

require_relative "gender"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class IndividualBaseOptional
        # @return [String]
        attr_reader :first_name
        # @return [String]
        attr_reader :last_name
        # @return [CandidApiClient::Individual::Types::Gender]
        attr_reader :gender
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param first_name [String]
        # @param last_name [String]
        # @param gender [CandidApiClient::Individual::Types::Gender]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::IndividualBaseOptional]
        def initialize(first_name: OMIT, last_name: OMIT, gender: OMIT, additional_properties: nil)
          @first_name = first_name if first_name != OMIT
          @last_name = last_name if last_name != OMIT
          @gender = gender if gender != OMIT
          @additional_properties = additional_properties
          @_field_set = { "first_name": first_name, "last_name": last_name, "gender": gender }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of IndividualBaseOptional
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::IndividualBaseOptional]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          first_name = struct["first_name"]
          last_name = struct["last_name"]
          gender = struct["gender"]
          new(
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            additional_properties: struct
          )
        end

        # Serialize an instance of IndividualBaseOptional to a JSON object
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
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.gender&.is_a?(CandidApiClient::Individual::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        end
      end
    end
  end
end
