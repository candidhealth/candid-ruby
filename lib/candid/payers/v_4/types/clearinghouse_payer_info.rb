# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        class ClearinghousePayerInfo < Internal::Types::Model
          field :payer_name, -> { String }, optional: false, nullable: false
          field :professional_payer_ids, -> { Candid::Payers::V4::Types::PayerIds }, optional: false, nullable: false
          field :institutional_payer_ids, -> { Candid::Payers::V4::Types::PayerIds }, optional: false, nullable: false
          field :professional_claims_support, lambda {
            Candid::Payers::V4::Types::SupportState
          }, optional: false, nullable: false
          field :institutional_claims_support, lambda {
            Candid::Payers::V4::Types::SupportState
          }, optional: false, nullable: false
          field :eligibility_support, -> { Candid::Payers::V4::Types::SupportState }, optional: false, nullable: false
          field :remittance_support, -> { Candid::Payers::V4::Types::SupportState }, optional: false, nullable: false
        end
      end
    end
  end
end
