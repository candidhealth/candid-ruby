# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Tags
      module V1
        module Types
          # An object representing a Tag.
          class MutableTag
            # @return [String]
            attr_reader :value
            # @return [String]
            attr_reader :description
            # @return [Boolean]
            attr_reader :alert
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param value [String]
            # @param description [String]
            # @param alert [Boolean]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag]
            def initialize(value:, description: OMIT, alert: OMIT, additional_properties: nil)
              @value = value
              @description = description if description != OMIT
              @alert = alert if alert != OMIT
              @additional_properties = additional_properties
              @_field_set = { "value": value, "description": description, "alert": alert }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutableTag
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              value = struct["value"]
              description = struct["description"]
              alert = struct["alert"]
              new(
                value: value,
                description: description,
                alert: alert,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutableTag to a JSON object
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
              obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
              obj.alert&.is_a?(Boolean) != false || raise("Passed value for field obj.alert is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
