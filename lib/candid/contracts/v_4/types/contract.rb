# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class Contract < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :contracting_provider, -> { Candid::OrganizationProviders::V2::Types::OrganizationProvider }, optional: false, nullable: false
          field :provider_count, -> { Integer }, optional: false, nullable: false
          field :contract_payer, -> { Candid::Contracts::V4::Types::ContractPayer }, optional: false, nullable: false
        end
      end
    end
  end
end
