# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class RemoveContractProvidersRequest < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :rendering_provider_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
