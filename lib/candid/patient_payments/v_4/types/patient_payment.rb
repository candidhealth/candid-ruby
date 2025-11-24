# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PatientPayment < Internal::Types::Model
          field :patient_payment_id, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: false, nullable: false
          field :source_internal_id, -> { String }, optional: true, nullable: false
          field :payment_source, lambda {
            Candid::Financials::Types::PatientTransactionSource
          }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
          field :allocations, lambda {
            Internal::Types::Array[Candid::Financials::Types::Allocation]
          }, optional: false, nullable: false
          field :invoice, -> { String }, optional: true, nullable: false
          field :payment_method_detail, lambda {
            Candid::PatientPayments::V4::Types::PaymentMethodDetail
          }, optional: true, nullable: false
        end
      end
    end
  end
end
