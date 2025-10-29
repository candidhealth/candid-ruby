# frozen_string_literal: true

module Candid
  module PreEncounter
    module Notes
      module V1
        module Types
          # A Note object with immutable server-owned properties.
          class Note < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :created_at, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
