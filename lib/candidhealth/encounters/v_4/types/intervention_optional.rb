# frozen_string_literal: true

require_relative "intervention_category"
require_relative "medication_optional"
require_relative "lab_optional"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class InterventionOptional
          # @return [String]
          attr_reader :name
          # @return [CandidApiClient::Encounters::V4::Types::InterventionCategory]
          attr_reader :category
          # @return [String] "Examples: 'Birth Control LAC', 'Tracking', 'Stress Management', 'Supplement',
          #  'Labs'"
          attr_reader :description
          # @return [CandidApiClient::Encounters::V4::Types::MedicationOptional] Required when `type` is `allopathic`.
          attr_reader :medication
          # @return [Array<CandidApiClient::Encounters::V4::Types::LabOptional>] Required when `type` is `tests`.
          attr_reader :labs
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String]
          # @param category [CandidApiClient::Encounters::V4::Types::InterventionCategory]
          # @param description [String] "Examples: 'Birth Control LAC', 'Tracking', 'Stress Management', 'Supplement',
          #  'Labs'"
          # @param medication [CandidApiClient::Encounters::V4::Types::MedicationOptional] Required when `type` is `allopathic`.
          # @param labs [Array<CandidApiClient::Encounters::V4::Types::LabOptional>] Required when `type` is `tests`.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::InterventionOptional]
          def initialize(name: OMIT, category: OMIT, description: OMIT, medication: OMIT, labs: OMIT,
                         additional_properties: nil)
            @name = name if name != OMIT
            @category = category if category != OMIT
            @description = description if description != OMIT
            @medication = medication if medication != OMIT
            @labs = labs if labs != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "category": category,
              "description": description,
              "medication": medication,
              "labs": labs
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InterventionOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::InterventionOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            name = struct["name"]
            category = struct["category"]
            description = struct["description"]
            if parsed_json["medication"].nil?
              medication = nil
            else
              medication = parsed_json["medication"].to_json
              medication = CandidApiClient::Encounters::V4::Types::MedicationOptional.from_json(json_object: medication)
            end
            labs = parsed_json["labs"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::LabOptional.from_json(json_object: item)
            end
            new(
              name: name,
              category: category,
              description: description,
              medication: medication,
              labs: labs,
              additional_properties: struct
            )
          end

          # Serialize an instance of InterventionOptional to a JSON object
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
            obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.category&.is_a?(CandidApiClient::Encounters::V4::Types::InterventionCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.medication.nil? || CandidApiClient::Encounters::V4::Types::MedicationOptional.validate_raw(obj: obj.medication)
            obj.labs&.is_a?(Array) != false || raise("Passed value for field obj.labs is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
