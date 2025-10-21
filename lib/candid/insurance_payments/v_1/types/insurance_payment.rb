# frozen_string_literal: true

module Candid
  module InsurancePayments
    module V1
      module Types
        class InsurancePayment < Internal::Types::Model
          field :insurance_payment_id, -> { String }, optional: false, nullable: false
          field :payer, -> { Candid::Payers::V3::Types::Payer }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::Allocation] }, optional: false, nullable: false

        end
      end
    end
  end
end
