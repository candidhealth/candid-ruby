# frozen_string_literal: true

module Candid
  module Identifiers
    module Types
      class MedicareProviderIdentifier < Internal::Types::Model
        field :state, -> { Candid::Commons::Types::State }, optional: false, nullable: false
        field :provider_number, -> { String }, optional: false, nullable: false
        field :organization_service_facility_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
