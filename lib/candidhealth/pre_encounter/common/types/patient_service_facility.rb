# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        # Represents a canonical service facility attached to a patient or patient
        #  dependent object
        class PatientServiceFacility
          # @return [String]
          attr_reader :service_facility_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param service_facility_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility]
          def initialize(service_facility_id:, additional_properties: nil)
            @service_facility_id = service_facility_id
            @additional_properties = additional_properties
            @_field_set = { "service_facility_id": service_facility_id }
          end

          # Deserialize a JSON object to an instance of PatientServiceFacility
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            service_facility_id = struct["service_facility_id"]
            new(service_facility_id: service_facility_id, additional_properties: struct)
          end

          # Serialize an instance of PatientServiceFacility to a JSON object
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
            obj.service_facility_id.is_a?(String) != false || raise("Passed value for field obj.service_facility_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
