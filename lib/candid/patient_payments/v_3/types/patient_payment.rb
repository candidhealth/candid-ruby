# frozen_string_literal: true

module Candid
  module PatientPayments
    module V3
      module Types
        class PatientPayment < Internal::Types::Model
          field :patient_payment_id, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: false, nullable: false
          field :source_internal_id, -> { String }, optional: false, nullable: false
          field :source, lambda {
            Candid::PatientPayments::V3::Types::PatientPaymentSource
          }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :payment_timestamp, -> { String }, optional: true, nullable: false
          field :status, lambda {
            Candid::PatientPayments::V3::Types::PatientPaymentStatus
          }, optional: true, nullable: false
          field :payment_name, -> { String }, optional: true, nullable: false
          field :payment_note, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :encounter_external_id, -> { String }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
