# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          # The patient's active coverages, in order of primary, secondary, etc.
          class FilingOrder
            # @return [Array<String>]
            attr_reader :coverages
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param coverages [Array<String>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            def initialize(coverages:, additional_properties: nil)
              @coverages = coverages
              @additional_properties = additional_properties
              @_field_set = { "coverages": coverages }
            end

            # Deserialize a JSON object to an instance of FilingOrder
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              coverages = struct["coverages"]
              new(coverages: coverages, additional_properties: struct)
            end

            # Serialize an instance of FilingOrder to a JSON object
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
              obj.coverages.is_a?(Array) != false || raise("Passed value for field obj.coverages is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
