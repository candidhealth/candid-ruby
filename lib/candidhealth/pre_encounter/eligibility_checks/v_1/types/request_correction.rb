# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class RequestCorrection
            # @return [String]
            attr_reader :property
            # @return [String]
            attr_reader :request_value
            # @return [String]
            attr_reader :corrected_value
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param property [String]
            # @param request_value [String]
            # @param corrected_value [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection]
            def initialize(property:, request_value:, corrected_value:, additional_properties: nil)
              @property = property
              @request_value = request_value
              @corrected_value = corrected_value
              @additional_properties = additional_properties
              @_field_set = { "property": property, "request_value": request_value, "corrected_value": corrected_value }
            end

            # Deserialize a JSON object to an instance of RequestCorrection
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              property = struct["property"]
              request_value = struct["request_value"]
              corrected_value = struct["corrected_value"]
              new(
                property: property,
                request_value: request_value,
                corrected_value: corrected_value,
                additional_properties: struct
              )
            end

            # Serialize an instance of RequestCorrection to a JSON object
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
              obj.property.is_a?(String) != false || raise("Passed value for field obj.property is not the expected type, validation failed.")
              obj.request_value.is_a?(String) != false || raise("Passed value for field obj.request_value is not the expected type, validation failed.")
              obj.corrected_value.is_a?(String) != false || raise("Passed value for field obj.corrected_value is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
