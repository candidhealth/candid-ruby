# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class ContractCreate < Internal::Types::Model
          field :contract_type, -> { Candid::Contracts::V4::Types::ContractType }, optional: false, nullable: false
          field :contracting_provider_id, -> { String }, optional: false, nullable: false
          field :contract_payer, -> { Candid::Contracts::V4::Types::ContractCreatePayer }, optional: false, nullable: false
        end
      end
    end
  end
end
