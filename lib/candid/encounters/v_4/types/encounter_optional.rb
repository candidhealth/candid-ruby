# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterOptional < Internal::Types::Model
          field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
