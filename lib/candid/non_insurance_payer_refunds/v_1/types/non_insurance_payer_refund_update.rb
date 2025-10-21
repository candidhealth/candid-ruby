
module Candid
  module NonInsurancePayerRefunds
    module V1
      module Types
        class NonInsurancePayerRefundUpdate < Internal::Types::Model
          field :non_insurance_payer_refund_id, -> { String }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { Candid::Financials::Types::NoteUpdate }, optional: true, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReasonUpdate }, optional: true, nullable: false
          field :invoice_id, -> { Candid::Financials::Types::InvoiceUpdate }, optional: true, nullable: false

        end
      end
    end
  end
end
