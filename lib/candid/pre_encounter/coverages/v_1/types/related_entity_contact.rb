# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class RelatedEntityContact < Internal::Types::Model
            field :mode, -> { String }, optional: true, nullable: false
            field :value, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
