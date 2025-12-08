# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractWithProvidersUnion < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Contracts::V3::Types::ProfessionalContract }, key: "PROFESSIONAL"
          member -> { Candid::Contracts::V3::Types::InstitutionalContract }, key: "INSTITUTIONAL"
        end
      end
    end
  end
end
