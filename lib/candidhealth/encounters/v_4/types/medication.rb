# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class Medication
          # @return [String]
          attr_reader :name
          # @return [String]
          attr_reader :rx_cui
          # @return [String]
          attr_reader :dosage
          # @return [String]
          attr_reader :dosage_form
          # @return [String]
          attr_reader :frequency
          # @return [Boolean]
          attr_reader :as_needed
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String]
          # @param rx_cui [String]
          # @param dosage [String]
          # @param dosage_form [String]
          # @param frequency [String]
          # @param as_needed [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::Medication]
          def initialize(name:, rx_cui: OMIT, dosage: OMIT, dosage_form: OMIT, frequency: OMIT, as_needed: OMIT,
                         additional_properties: nil)
            @name = name
            @rx_cui = rx_cui if rx_cui != OMIT
            @dosage = dosage if dosage != OMIT
            @dosage_form = dosage_form if dosage_form != OMIT
            @frequency = frequency if frequency != OMIT
            @as_needed = as_needed if as_needed != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "rx_cui": rx_cui,
              "dosage": dosage,
              "dosage_form": dosage_form,
              "frequency": frequency,
              "as_needed": as_needed
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Medication
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::Medication]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            name = struct["name"]
            rx_cui = struct["rx_cui"]
            dosage = struct["dosage"]
            dosage_form = struct["dosage_form"]
            frequency = struct["frequency"]
            as_needed = struct["as_needed"]
            new(
              name: name,
              rx_cui: rx_cui,
              dosage: dosage,
              dosage_form: dosage_form,
              frequency: frequency,
              as_needed: as_needed,
              additional_properties: struct
            )
          end

          # Serialize an instance of Medication to a JSON object
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
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.rx_cui&.is_a?(String) != false || raise("Passed value for field obj.rx_cui is not the expected type, validation failed.")
            obj.dosage&.is_a?(String) != false || raise("Passed value for field obj.dosage is not the expected type, validation failed.")
            obj.dosage_form&.is_a?(String) != false || raise("Passed value for field obj.dosage_form is not the expected type, validation failed.")
            obj.frequency&.is_a?(String) != false || raise("Passed value for field obj.frequency is not the expected type, validation failed.")
            obj.as_needed&.is_a?(Boolean) != false || raise("Passed value for field obj.as_needed is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
