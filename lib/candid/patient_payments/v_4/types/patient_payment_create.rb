# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PatientPaymentCreate < Internal::Types::Model
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :allocations, lambda {
            Internal::Types::Array[Candid::Financials::Types::AllocationCreate]
          }, optional: false, nullable: false
          field :invoice, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
