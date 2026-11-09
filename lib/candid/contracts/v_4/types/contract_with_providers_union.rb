# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class ContractWithProvidersUnion < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Contracts::V4::Types::ProfessionalContract }, key: "PROFESSIONAL"
          member -> { Candid::Contracts::V4::Types::InstitutionalContract }, key: "INSTITUTIONAL"
        end
      end
    end
  end
end
