# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class ClinicalNoteOptional < Internal::Types::Model
          field :text, -> { String }, optional: true, nullable: false
          field :author_name, -> { String }, optional: true, nullable: false
          field :author_npi, -> { String }, optional: true, nullable: false
          field :timestamp, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
