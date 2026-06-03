# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          class ImageGetMultiRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: true, nullable: false
            field :coverage_id, -> { String }, optional: true, nullable: false
            field :file_type, -> { String }, optional: true, nullable: false
            field :patient_notes, -> { String }, optional: true, nullable: false
            field :sort_field, -> { Candid::PreEncounter::Images::V1::Types::ImageSortField }, optional: true, nullable: false
            field :sort_direction, -> { Candid::PreEncounter::Common::Types::SortDirection }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
