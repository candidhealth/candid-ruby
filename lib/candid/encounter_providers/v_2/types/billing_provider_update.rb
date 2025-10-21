# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        # The billing provider is the provider or business entity submitting the claim.
        # Billing provider may be, but is not necessarily, the same person/NPI as the rendering provider.
        # From a payer's perspective, this represents the person or entity being reimbursed.
        # When a contract exists with the target payer, the billing provider should be the entity contracted with the payer.
        # In some circumstances, this will be an individual provider. In that case, submit that provider's NPI and the
        # tax ID (TIN) that the provider gave to the payer during contracting.
        # In other cases, the billing entity will be a medical group. If so, submit the group NPI and the group's tax ID.
        # Box 33 on the CMS-1500 claim or Form Locator 1 on a UB-04 claim form.
        class BillingProviderUpdate < Internal::Types::Model
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :tax_id, -> { String }, optional: true, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :provider_commercial_license_type, -> { Candid::Commons::Types::BillingProviderCommercialLicenseType }, optional: true, nullable: false

        end
      end
    end
  end
end
