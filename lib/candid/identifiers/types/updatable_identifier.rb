# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class UpdatableIdentifier < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Identifiers::Types::IdentifierCreate }, key: "ADD"
        member -> { Candid::Identifiers::Types::IdentifierUpdate }, key: "UPDATE"
        member -> { String }, key: "REMOVE"
      end
    end
  end
end
