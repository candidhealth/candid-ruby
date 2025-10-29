# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class ContractWithProviders < Internal::Types::Model
          field :rendering_provider_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
