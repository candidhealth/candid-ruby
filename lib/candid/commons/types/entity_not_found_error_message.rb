# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class EntityNotFoundErrorMessage < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
