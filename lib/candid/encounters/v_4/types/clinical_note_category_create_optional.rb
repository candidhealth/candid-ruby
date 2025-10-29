# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClinicalNoteCategoryCreateOptional < Internal::Types::Model
          field :category, -> { Candid::Encounters::V4::Types::NoteCategory }, optional: true, nullable: false
          field :notes, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteOptional]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
