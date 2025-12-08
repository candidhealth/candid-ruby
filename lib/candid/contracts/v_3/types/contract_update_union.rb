# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractUpdateUnion < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Contracts::V3::Types::ProfessionalContractUpdate }, key: "PROFESSIONAL"
          member -> { Candid::Contracts::V3::Types::InstitutionalContractUpdate }, key: "INSTITUTIONAL"
        end
      end
    end
  end
end
