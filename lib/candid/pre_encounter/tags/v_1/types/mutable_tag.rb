# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      module V1
        module Types
          # An object representing a Tag.
          class MutableTag < Internal::Types::Model
            field :value, -> { String }, optional: false, nullable: false
            field :description, -> { String }, optional: true, nullable: false
            field :alert, -> { Internal::Types::Boolean }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
