# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class ContractInvalidExpirationDateError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
