# frozen_string_literal: true

require_relative "rx_cui"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class Medication
        attr_reader :name, :rx_cui, :dosage, :dosage_form, :frequency, :as_needed, :additional_properties

        # @param name [String]
        # @param rx_cui [Encounters::V4::RX_CUI]
        # @param dosage [String]
        # @param dosage_form [String]
        # @param frequency [String]
        # @param as_needed [Boolean]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::Medication]
        def initialize(name:, rx_cui: nil, dosage: nil, dosage_form: nil, frequency: nil, as_needed: nil,
                       additional_properties: nil)
          # @type [String]
          @name = name
          # @type [Encounters::V4::RX_CUI]
          @rx_cui = rx_cui
          # @type [String]
          @dosage = dosage
          # @type [String]
          @dosage_form = dosage_form
          # @type [String]
          @frequency = frequency
          # @type [Boolean]
          @as_needed = as_needed
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Medication
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::Medication]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          name = struct.name
          rx_cui = struct.rx_cui
          dosage = struct.dosage
          dosage_form = struct.dosage_form
          frequency = struct.frequency
          as_needed = struct.as_needed
          new(name: name, rx_cui: rx_cui, dosage: dosage, dosage_form: dosage_form, frequency: frequency,
              as_needed: as_needed, additional_properties: struct)
        end

        # Serialize an instance of Medication to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "name": @name,
            "rx_cui": @rx_cui,
            "dosage": @dosage,
            "dosage_form": @dosage_form,
            "frequency": @frequency,
            "as_needed": @as_needed
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
