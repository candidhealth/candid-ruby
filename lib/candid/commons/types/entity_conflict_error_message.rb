# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class EntityConflictErrorMessage < Internal::Types::Model
        field :entity_name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
