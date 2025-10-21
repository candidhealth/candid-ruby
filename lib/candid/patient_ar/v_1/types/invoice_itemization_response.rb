# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class InvoiceItemizationResponse < Internal::Types::Model
          field :claim_id, -> { String }, optional: false, nullable: false
          field :patient_balance_cents, -> { Integer }, optional: false, nullable: false
          field :claim_level_patient_payments, -> { Candid::PatientAr::V1::Types::PatientPaymentInfo }, optional: false, nullable: false
          field :service_line_itemization, -> { Internal::Types::Array[Candid::PatientAr::V1::Types::ServiceLineItemization] }, optional: false, nullable: false

        end
      end
    end
  end
end
