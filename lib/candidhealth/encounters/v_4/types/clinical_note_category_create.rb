# frozen_string_literal: true

require_relative "note_category"
require_relative "clinical_note"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class ClinicalNoteCategoryCreate
        attr_reader :category, :notes, :additional_properties

        # @param category [Encounters::V4::NoteCategory]
        # @param notes [Array<Encounters::V4::ClinicalNote>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::ClinicalNoteCategoryCreate]
        def initialize(category:, notes:, additional_properties: nil)
          # @type [Encounters::V4::NoteCategory]
          @category = category
          # @type [Array<Encounters::V4::ClinicalNote>]
          @notes = notes
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClinicalNoteCategoryCreate
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::ClinicalNoteCategoryCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          category = struct.category
          notes = parsed_json["notes"]&.map do |v|
            v = v.to_json
            Encounters::V4::ClinicalNote.from_json(json_object: v)
          end
          new(category: category, notes: notes, additional_properties: struct)
        end

        # Serialize an instance of ClinicalNoteCategoryCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "category": @category, "notes": @notes }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.category.is_a?(Encounters::V4::NoteCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
          obj.notes.is_a?(Array) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
        end
      end
    end
  end
end
