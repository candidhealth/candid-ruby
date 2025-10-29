# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class Contract < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :contracting_provider, lambda {
            Candid::OrganizationProviders::V2::Types::OrganizationProvider
          }, optional: false, nullable: false
          field :provider_count, -> { Integer }, optional: false, nullable: false
          field :payer, -> { Candid::Payers::V3::Types::Payer }, optional: false, nullable: false
        end
      end
    end
  end
end
