# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class IdentifierValue < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Identifiers::Types::MedicareProviderIdentifier }, key: "MEDICARE_PROVIDER_IDENTIFIER"
        member -> { Candid::Identifiers::Types::MedicaidProviderIdentifier }, key: "MEDICAID_PROVIDER_IDENTIFIER"
      end
    end
  end
end
