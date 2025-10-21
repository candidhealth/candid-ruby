
module Candid
  module Contracts
    module V2
      module Types
        class ContractUpdate < Internal::Types::Model
          field :contract_id, -> { String }, optional: false, nullable: false
          field :rendering_provider_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :effective_date, -> { String }, optional: true, nullable: false
          field :expiration_date, -> { Candid::Contracts::V2::Types::DateUpdate }, optional: true, nullable: false
          field :regions, -> { Candid::Contracts::V2::Types::RegionsUpdate }, optional: true, nullable: false
          field :contract_status, -> { Candid::Contracts::V2::Types::ContractStatus }, optional: true, nullable: false
          field :authorized_signatory, -> { Candid::Contracts::V2::Types::AuthorizedSignatoryUpdate }, optional: true, nullable: false
          field :commercial_insurance_types, -> { Candid::Contracts::V2::Types::InsuranceTypes }, optional: true, nullable: false
          field :medicare_insurance_types, -> { Candid::Contracts::V2::Types::InsuranceTypes }, optional: true, nullable: false
          field :medicaid_insurance_types, -> { Candid::Contracts::V2::Types::InsuranceTypes }, optional: true, nullable: false

        end
      end
    end
  end
end
