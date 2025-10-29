# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClinicalNoteCategoryCreate < Internal::Types::Model
          field :category, -> { Candid::Encounters::V4::Types::NoteCategory }, optional: false, nullable: false
          field :notes, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNote]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
