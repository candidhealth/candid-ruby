# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      module Types
        class InsuranceRefundUpdate < Internal::Types::Model
          field :insurance_refund_id, -> { String }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { Candid::Financials::Types::NoteUpdate }, optional: true, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReasonUpdate }, optional: true, nullable: false
        end
      end
    end
  end
end
