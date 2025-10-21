# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          # A coverage object with immutable server-owned properties.
          class Coverage < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
