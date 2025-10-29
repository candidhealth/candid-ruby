# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class ContractsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Contracts::V2::Types::Contract]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
