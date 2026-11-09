# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class RemoveContractServiceFacilityProvidersRequest < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :contract_service_facility_id, -> { String }, optional: false, nullable: false
          field :provider_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
