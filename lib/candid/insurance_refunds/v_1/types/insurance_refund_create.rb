# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      module Types
        class InsuranceRefundCreate < Internal::Types::Model
          field :payer_identifier, -> { Candid::Payers::V3::Types::PayerIdentifier }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { String }, optional: true, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::AllocationCreate] }, optional: false, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReason }, optional: true, nullable: false

        end
      end
    end
  end
end
