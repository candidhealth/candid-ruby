# frozen_string_literal: true

module Candid
  module InsuranceAdjudications
    module V1
      module Types
        class InsuranceAdjudicationCreate < Internal::Types::Model
          field :payer_identifier, -> { Candid::Payers::V3::Types::PayerIdentifier }, optional: false, nullable: false
          field :payee, -> { Candid::Remits::V1::Types::Payee }, optional: false, nullable: false
          field :post_date, -> { String }, optional: true, nullable: false
          field :check_number, -> { String }, optional: true, nullable: false
          field :check_date, -> { String }, optional: false, nullable: false
          field :check_amount_cents, -> { Integer }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :claims, -> { Internal::Types::Hash[String, Internal::Types::Array[Candid::InsuranceAdjudications::V1::Types::ClaimAdjudicationCreate]] }, optional: false, nullable: false
          field :remit_draft_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
