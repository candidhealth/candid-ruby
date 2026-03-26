# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractProviderCount < Internal::Types::Model
          field :provider_count, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
