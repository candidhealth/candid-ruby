# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::Encounter]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
