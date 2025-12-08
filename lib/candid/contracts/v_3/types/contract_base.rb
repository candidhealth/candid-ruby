# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractBase < Internal::Types::Model
          field :effective_date, -> { String }, optional: false, nullable: false
          field :expiration_date, -> { String }, optional: true, nullable: false
          field :regions, -> { Candid::Commons::Types::Regions }, optional: false, nullable: false
          field :contract_status, -> { Candid::Contracts::V2::Types::ContractStatus }, optional: true, nullable: false
          field :authorized_signatory, lambda {
            Candid::Contracts::V2::Types::AuthorizedSignatory
          }, optional: true, nullable: false
          field :commercial_insurance_types, lambda {
            Candid::Contracts::V2::Types::InsuranceTypes
          }, optional: false, nullable: false
          field :medicare_insurance_types, lambda {
            Candid::Contracts::V2::Types::InsuranceTypes
          }, optional: false, nullable: false
          field :medicaid_insurance_types, lambda {
            Candid::Contracts::V2::Types::InsuranceTypes
          }, optional: false, nullable: false
        end
      end
    end
  end
end
