# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoveragesPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::Coverage] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
