# frozen_string_literal: true

require_relative "universal_service_identifier"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        module Types
          class Service
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier] Contains the code describing the activity type that is being scheduled.
            attr_reader :universal_service_identifier
            # @return [DateTime]
            attr_reader :start_timestamp
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param universal_service_identifier [CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier] Contains the code describing the activity type that is being scheduled.
            # @param start_timestamp [DateTime]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Service]
            def initialize(universal_service_identifier: OMIT, start_timestamp: OMIT, additional_properties: nil)
              @universal_service_identifier = universal_service_identifier if universal_service_identifier != OMIT
              @start_timestamp = start_timestamp if start_timestamp != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "universal_service_identifier": universal_service_identifier,
                "start_timestamp": start_timestamp
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Service
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Service]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              universal_service_identifier = struct["universal_service_identifier"]
              start_timestamp = unless parsed_json["start_timestamp"].nil?
                                  DateTime.parse(parsed_json["start_timestamp"])
                                end
              new(
                universal_service_identifier: universal_service_identifier,
                start_timestamp: start_timestamp,
                additional_properties: struct
              )
            end

            # Serialize an instance of Service to a JSON object
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
              obj.universal_service_identifier&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier) != false || raise("Passed value for field obj.universal_service_identifier is not the expected type, validation failed.")
              obj.start_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.start_timestamp is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
