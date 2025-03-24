# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Images
      module V1
        module Types
          # An association to a Patient.
          class PatientAssociation
            # @return [String]
            attr_reader :id
            # @return [String]
            attr_reader :notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param id [String]
            # @param notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation]
            def initialize(id:, notes: OMIT, additional_properties: nil)
              @id = id
              @notes = notes if notes != OMIT
              @additional_properties = additional_properties
              @_field_set = { "id": id, "notes": notes }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PatientAssociation
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              id = struct["id"]
              notes = struct["notes"]
              new(
                id: id,
                notes: notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of PatientAssociation to a JSON object
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
              obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
              obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
