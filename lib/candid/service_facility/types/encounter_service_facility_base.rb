# frozen_string_literal: true

module Candid
  module ServiceFacility
    module Types
      # Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital.
      # For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home),
      # or the location where an in-person visit would have taken place, whichever is easier to identify.
      # If the provider is in-network, service facility may be defined in payer contracts.
      # Box 32 on the CMS-1500 claim form.
      # Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims
      # must match what was provided to the payer during the credentialing process.
      class EncounterServiceFacilityBase < Internal::Types::Model
        field :organization_name, -> { String }, optional: false, nullable: false
        field :npi, -> { String }, optional: true, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: false, nullable: false
        field :secondary_identification, -> { String }, optional: true, nullable: false
      end
    end
  end
end
