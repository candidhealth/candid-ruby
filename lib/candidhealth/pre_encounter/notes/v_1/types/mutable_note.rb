# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Notes
      module V1
        module Types
          # An object representing a Note.
          class MutableNote
            # @return [String]
            attr_reader :value
            # @return [String]
            attr_reader :author_email
            # @return [String]
            attr_reader :author_name
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param value [String]
            # @param author_email [String]
            # @param author_name [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote]
            def initialize(value:, author_email: OMIT, author_name: OMIT, additional_properties: nil)
              @value = value
              @author_email = author_email if author_email != OMIT
              @author_name = author_name if author_name != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "value": value,
                "author_email": author_email,
                "author_name": author_name
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutableNote
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Notes::V1::Types::MutableNote]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              value = struct["value"]
              author_email = struct["author_email"]
              author_name = struct["author_name"]
              new(
                value: value,
                author_email: author_email,
                author_name: author_name,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutableNote to a JSON object
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
              obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
              obj.author_email&.is_a?(String) != false || raise("Passed value for field obj.author_email is not the expected type, validation failed.")
              obj.author_name&.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
