# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      module V1
        module Types
          # A Tag object with immutable server-owned properties.
          class Tag < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
