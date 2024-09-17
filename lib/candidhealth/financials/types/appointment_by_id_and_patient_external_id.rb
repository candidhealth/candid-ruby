# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Financials
    module Types
      class AppointmentByIdAndPatientExternalId
        # @return [String]
        attr_reader :appointment_id
        # @return [String]
        attr_reader :patient_external_id
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param appointment_id [String]
        # @param patient_external_id [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Financials::Types::AppointmentByIdAndPatientExternalId]
        def initialize(appointment_id:, patient_external_id:, additional_properties: nil)
          @appointment_id = appointment_id
          @patient_external_id = patient_external_id
          @additional_properties = additional_properties
          @_field_set = { "appointment_id": appointment_id, "patient_external_id": patient_external_id }
        end

        # Deserialize a JSON object to an instance of AppointmentByIdAndPatientExternalId
        #
        # @param json_object [String]
        # @return [CandidApiClient::Financials::Types::AppointmentByIdAndPatientExternalId]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          appointment_id = struct["appointment_id"]
          patient_external_id = struct["patient_external_id"]
          new(
            appointment_id: appointment_id,
            patient_external_id: patient_external_id,
            additional_properties: struct
          )
        end

        # Serialize an instance of AppointmentByIdAndPatientExternalId to a JSON object
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
          obj.appointment_id.is_a?(String) != false || raise("Passed value for field obj.appointment_id is not the expected type, validation failed.")
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
