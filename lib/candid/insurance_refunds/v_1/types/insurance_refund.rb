# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      module Types
        class InsuranceRefund < Internal::Types::Model
          field :insurance_refund_id, -> { String }, optional: false, nullable: false
          field :payer, -> { Candid::Payers::V3::Types::Payer }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { String }, optional: true, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::Allocation] }, optional: false, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReason }, optional: true, nullable: false

        end
      end
    end
  end
end
