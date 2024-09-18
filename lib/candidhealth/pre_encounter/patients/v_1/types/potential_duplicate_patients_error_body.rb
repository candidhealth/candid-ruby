# frozen_string_literal: true

require_relative "potential_duplicate_patient"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class PotentialDuplicatePatientsErrorBody
            # @return [String]
            attr_reader :code
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatient>]
            attr_reader :potential_duplicates
            # @return [String]
            attr_reader :message
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param code [String]
            # @param potential_duplicates [Array<CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatient>]
            # @param message [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatientsErrorBody]
            def initialize(code:, potential_duplicates:, message:, additional_properties: nil)
              @code = code
              @potential_duplicates = potential_duplicates
              @message = message
              @additional_properties = additional_properties
              @_field_set = { "code": code, "potential_duplicates": potential_duplicates, "message": message }
            end

            # Deserialize a JSON object to an instance of PotentialDuplicatePatientsErrorBody
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatientsErrorBody]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              code = struct["code"]
              potential_duplicates = parsed_json["potential_duplicates"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatient.from_json(json_object: item)
              end
              message = struct["message"]
              new(
                code: code,
                potential_duplicates: potential_duplicates,
                message: message,
                additional_properties: struct
              )
            end

            # Serialize an instance of PotentialDuplicatePatientsErrorBody to a JSON object
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
              obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
              obj.potential_duplicates.is_a?(Array) != false || raise("Passed value for field obj.potential_duplicates is not the expected type, validation failed.")
              obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
