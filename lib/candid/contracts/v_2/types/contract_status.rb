# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        module ContractStatus
          extend Candid::Internal::Types::Enum
          PENDING = "pending"
          EFFECTIVE = "effective"
          CANCELLED = "cancelled"end
      end
    end
  end
end
