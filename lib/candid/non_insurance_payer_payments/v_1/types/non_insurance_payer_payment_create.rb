# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    module V1
      module Types
        class NonInsurancePayerPaymentCreate < Internal::Types::Model
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
          field :check_number, -> { String }, optional: true, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::AllocationCreate] }, optional: false, nullable: false
          field :invoice_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
