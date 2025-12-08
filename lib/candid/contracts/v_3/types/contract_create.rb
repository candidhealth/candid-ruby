# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractCreate < Internal::Types::Model
          field :contract_type, -> { Candid::Contracts::V3::Types::ContractType }, optional: false, nullable: false
          field :contracting_provider_id, -> { String }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
