# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          # An object representing an Image.
          class MutableImage < Internal::Types::Model
            field :file_name, -> { String }, optional: false, nullable: false
            field :display_name, -> { String }, optional: false, nullable: false
            field :file_type, -> { String }, optional: false, nullable: false
            field :status, -> { Candid::PreEncounter::Images::V1::Types::ImageStatus }, optional: false, nullable: false
            field :coverage, -> { Candid::PreEncounter::Images::V1::Types::CoverageAssociation }, optional: true, nullable: false
            field :patient, -> { Candid::PreEncounter::Images::V1::Types::PatientAssociation }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
