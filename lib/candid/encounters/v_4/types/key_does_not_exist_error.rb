# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class KeyDoesNotExistError < Internal::Types::Model
          field :key, -> { String }, optional: false, nullable: false
          field :schema_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
