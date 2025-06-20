# frozen_string_literal: true

require_relative "note_category"
require_relative "clinical_note_optional"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class ClinicalNoteCategoryCreateOptional
          # @return [CandidApiClient::Encounters::V4::Types::NoteCategory]
          attr_reader :category
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteOptional>]
          attr_reader :notes
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param category [CandidApiClient::Encounters::V4::Types::NoteCategory]
          # @param notes [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteOptional>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional]
          def initialize(category: OMIT, notes: OMIT, additional_properties: nil)
            @category = category if category != OMIT
            @notes = notes if notes != OMIT
            @additional_properties = additional_properties
            @_field_set = { "category": category, "notes": notes }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClinicalNoteCategoryCreateOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            category = struct["category"]
            notes = parsed_json["notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClinicalNoteOptional.from_json(json_object: item)
            end
            new(
              category: category,
              notes: notes,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClinicalNoteCategoryCreateOptional to a JSON object
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
            obj.category&.is_a?(CandidApiClient::Encounters::V4::Types::NoteCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.notes&.is_a?(Array) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
