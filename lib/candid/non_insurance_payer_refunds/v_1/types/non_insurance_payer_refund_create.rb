# frozen_string_literal: true

module Candid
  module NonInsurancePayerRefunds
    module V1
      module Types
        class NonInsurancePayerRefundCreate < Internal::Types::Model
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :invoice_id, -> { String }, optional: true, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { String }, optional: true, nullable: false
          field :check_number, -> { String }, optional: true, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::AllocationCreate] }, optional: false, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReason }, optional: true, nullable: false

        end
      end
    end
  end
end
