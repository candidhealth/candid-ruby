# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    module V1
      module Types
        class UpdateNonInsurancePayerPaymentRequest < Internal::Types::Model
          field :non_insurance_payer_payment_id, -> { String }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { Candid::Financials::Types::NoteUpdate }, optional: true, nullable: false
          field :invoice_id, -> { Candid::Financials::Types::InvoiceUpdate }, optional: true, nullable: false
        end
      end
    end
  end
end
