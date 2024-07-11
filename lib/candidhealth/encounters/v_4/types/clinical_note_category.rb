# frozen_string_literal: true

require_relative "note_category"
require_relative "clinical_note"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class ClinicalNoteCategory
          # @return [CandidApiClient::Encounters::V4::Types::NoteCategory]
          attr_reader :category
          # @return [Array<String>]
          attr_reader :notes
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>]
          attr_reader :notes_structured
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param category [CandidApiClient::Encounters::V4::Types::NoteCategory]
          # @param notes [Array<String>]
          # @param notes_structured [Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteCategory]
          def initialize(category:, notes:, notes_structured: OMIT, additional_properties: nil)
            @category = category
            @notes = notes
            @notes_structured = notes_structured if notes_structured != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "category": category,
              "notes": notes,
              "notes_structured": notes_structured
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClinicalNoteCategory
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::ClinicalNoteCategory]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            category = struct["category"]
            notes = struct["notes"]
            notes_structured = parsed_json["notes_structured"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClinicalNote.from_json(json_object: item)
            end
            new(
              category: category,
              notes: notes,
              notes_structured: notes_structured,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClinicalNoteCategory to a JSON object
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
            obj.category.is_a?(CandidApiClient::Encounters::V4::Types::NoteCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.notes.is_a?(Array) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
            obj.notes_structured&.is_a?(Array) != false || raise("Passed value for field obj.notes_structured is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
