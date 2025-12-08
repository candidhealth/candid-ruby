# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ProfessionalContractUpdate < Internal::Types::Model
          field :rendering_provider_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
