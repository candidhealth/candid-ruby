# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Contracts::V3::Types::ContractUnion]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
