# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractServiceFacilityBase < Internal::Types::Model
          field :service_facility_id, -> { String }, optional: false, nullable: false
          field :provider_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
