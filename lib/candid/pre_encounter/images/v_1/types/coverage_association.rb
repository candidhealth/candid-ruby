# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          # An association to a Coverage.
          class CoverageAssociation < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :side, lambda {
              Candid::PreEncounter::Images::V1::Types::CoverageImageSide
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
