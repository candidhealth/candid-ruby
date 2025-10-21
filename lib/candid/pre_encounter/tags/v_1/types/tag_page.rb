# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      module V1
        module Types
          class TagPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::Tags::V1::Types::Tag] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
