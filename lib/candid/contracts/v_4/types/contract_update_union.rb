# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class ContractUpdateUnion < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Contracts::V4::Types::ProfessionalContractUpdate }, key: "PROFESSIONAL"
          member -> { Candid::Contracts::V4::Types::InstitutionalContractUpdate }, key: "INSTITUTIONAL"
        end
      end
    end
  end
end
