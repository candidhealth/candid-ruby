# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class GetContractRequest < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
