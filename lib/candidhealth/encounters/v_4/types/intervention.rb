# frozen_string_literal: true

require_relative "intervention_category"
require_relative "medication"
require_relative "lab"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class Intervention
        attr_reader :name, :category, :description, :medication, :labs, :additional_properties

        # @param name [String]
        # @param category [Encounters::V4::InterventionCategory]
        # @param description [String] "Examples: 'Birth Control LAC', 'Tracking', 'Stress Management', 'Supplement', 'Labs'"
        # @param medication [Encounters::V4::Medication] Required when `type` is `allopathic`.
        # @param labs [Array<Encounters::V4::Lab>] Required when `type` is `tests`.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::Intervention]
        def initialize(name:, category:, description: nil, medication: nil, labs: nil, additional_properties: nil)
          # @type [String]
          @name = name
          # @type [Encounters::V4::InterventionCategory]
          @category = category
          # @type [String] "Examples: 'Birth Control LAC', 'Tracking', 'Stress Management', 'Supplement', 'Labs'"
          @description = description
          # @type [Encounters::V4::Medication] Required when `type` is `allopathic`.
          @medication = medication
          # @type [Array<Encounters::V4::Lab>] Required when `type` is `tests`.
          @labs = labs
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Intervention
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::Intervention]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          name = struct.name
          category = struct.category
          description = struct.description
          if parsed_json["medication"].nil?
            medication = nil
          else
            medication = parsed_json["medication"].to_json
            medication = Encounters::V4::Medication.from_json(json_object: medication)
          end
          labs = parsed_json["labs"]&.map do |v|
            v = v.to_json
            Encounters::V4::Lab.from_json(json_object: v)
          end
          new(name: name, category: category, description: description, medication: medication, labs: labs,
              additional_properties: struct)
        end

        # Serialize an instance of Intervention to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "name": @name,
            "category": @category,
            "description": @description,
            "medication": @medication,
            "labs": @labs
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.category.is_a?(Encounters::V4::InterventionCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
          obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.medication.nil? || Encounters::V4::Medication.validate_raw(obj: obj.medication)
          obj.labs&.is_a?(Array) != false || raise("Passed value for field obj.labs is not the expected type, validation failed.")
        end
      end
    end
  end
end
