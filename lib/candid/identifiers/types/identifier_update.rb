# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class IdentifierUpdate < Internal::Types::Model
        field :identifier_id, -> { String }, optional: false, nullable: false
        field :identifier_code, -> { Candid::Identifiers::Types::IdentifierCode }, optional: true, nullable: false
        field :identifier_value, -> { Candid::Identifiers::Types::IdentifierValue }, optional: true, nullable: false
        field :period, -> { Candid::Commons::Types::RemovableDateRangeOptionalEnd }, optional: true, nullable: false
      end
    end
  end
end
