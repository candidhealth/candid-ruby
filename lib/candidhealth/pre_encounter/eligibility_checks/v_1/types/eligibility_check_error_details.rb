# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # This object is our fern representation of Stedi's EligbilityCheckError object
          #  from their API.
          class EligibilityCheckErrorDetails
            # @return [String]
            attr_reader :field
            # @return [String]
            attr_reader :description
            # @return [String]
            attr_reader :location
            # @return [String]
            attr_reader :possible_resolutions
            # @return [String]
            attr_reader :code
            # @return [String]
            attr_reader :followup_action
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param field [String]
            # @param description [String]
            # @param location [String]
            # @param possible_resolutions [String]
            # @param code [String]
            # @param followup_action [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails]
            def initialize(field: OMIT, description: OMIT, location: OMIT, possible_resolutions: OMIT, code: OMIT,
                           followup_action: OMIT, additional_properties: nil)
              @field = field if field != OMIT
              @description = description if description != OMIT
              @location = location if location != OMIT
              @possible_resolutions = possible_resolutions if possible_resolutions != OMIT
              @code = code if code != OMIT
              @followup_action = followup_action if followup_action != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "field?": field,
                "description?": description,
                "location?": location,
                "possibleResolutions?": possible_resolutions,
                "code?": code,
                "followupAction?": followup_action
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of EligibilityCheckErrorDetails
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              field = struct["field?"]
              description = struct["description?"]
              location = struct["location?"]
              possible_resolutions = struct["possibleResolutions?"]
              code = struct["code?"]
              followup_action = struct["followupAction?"]
              new(
                field: field,
                description: description,
                location: location,
                possible_resolutions: possible_resolutions,
                code: code,
                followup_action: followup_action,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityCheckErrorDetails to a JSON object
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
              obj.field&.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
              obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
              obj.location&.is_a?(String) != false || raise("Passed value for field obj.location is not the expected type, validation failed.")
              obj.possible_resolutions&.is_a?(String) != false || raise("Passed value for field obj.possible_resolutions is not the expected type, validation failed.")
              obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
              obj.followup_action&.is_a?(String) != false || raise("Passed value for field obj.followup_action is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
