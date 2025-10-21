# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class IdentifierBase < Internal::Types::Model
        field :period, -> { Candid::Commons::Types::DateRangeOptionalEnd }, optional: true, nullable: false
        field :identifier_code, -> { Candid::Identifiers::Types::IdentifierCode }, optional: false, nullable: false
        field :identifier_value, -> { Candid::Identifiers::Types::IdentifierValue }, optional: false, nullable: false

      end
    end
  end
end
