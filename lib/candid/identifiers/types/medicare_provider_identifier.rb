# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class MedicareProviderIdentifier < Internal::Types::Model
        field :state, -> { Candid::Commons::Types::State }, optional: false, nullable: false
        field :provider_number, -> { String }, optional: false, nullable: false
      end
    end
  end
end
