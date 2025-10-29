# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClinicalNoteCategory < Internal::Types::Model
          field :category, -> { Candid::Encounters::V4::Types::NoteCategory }, optional: false, nullable: false
          field :notes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :notes_structured, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNote]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
