# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class InstitutionalContract < Internal::Types::Model
          field :contract_service_facilities, -> { Internal::Types::Array[Candid::Contracts::V4::Types::ContractServiceFacility] }, optional: false, nullable: false
        end
      end
    end
  end
end
