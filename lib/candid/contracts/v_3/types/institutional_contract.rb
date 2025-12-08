# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class InstitutionalContract < Internal::Types::Model
          field :contract_service_facilities, lambda {
            Internal::Types::Array[Candid::Contracts::V3::Types::ContractServiceFacility]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
