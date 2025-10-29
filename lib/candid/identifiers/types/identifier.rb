# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class Identifier < Internal::Types::Model
        field :identifier_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
