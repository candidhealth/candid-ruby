# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PatientPaymentUpdate < Internal::Types::Model
          field :patient_payment_id, -> { String }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { Candid::Financials::Types::NoteUpdate }, optional: true, nullable: false
          field :invoice, -> { Candid::Financials::Types::InvoiceUpdate }, optional: true, nullable: false
        end
      end
    end
  end
end
