# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class InstitutionalContractUpdate < Internal::Types::Model
          field :contract_service_facility_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
