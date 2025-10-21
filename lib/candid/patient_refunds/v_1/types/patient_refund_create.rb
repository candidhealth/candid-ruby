
module Candid
  module PatientRefunds
    module V1
      module Types
        class PatientRefundCreate < Internal::Types::Model
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :refund_timestamp, -> { String }, optional: true, nullable: false
          field :refund_note, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :allocations, -> { Internal::Types::Array[Candid::Financials::Types::AllocationCreate] }, optional: false, nullable: false
          field :invoice, -> { String }, optional: true, nullable: false
          field :refund_reason, -> { Candid::Financials::Types::RefundReason }, optional: true, nullable: false

        end
      end
    end
  end
end
