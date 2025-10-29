# frozen_string_literal: true

module Candid
  module PatientRefunds
    module V1
      module Types
        class PatientRefund < Internal::Types::Model
          field :patient_refund_id, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: false, nullable: false
          field :source_internal_id, -> { String }, optional: true, nullable: false
          field :refund_source, lambda {
            Candid::Financials::Types::PatientTransactionSource
          }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { String }, optional: true, nullable: false
          field :allocations, lambda {
            Internal::Types::Array[Candid::Financials::Types::Allocation]
          }, optional: false, nullable: false
          field :invoice, -> { String }, optional: true, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReason }, optional: true, nullable: false
        end
      end
    end
  end
end
