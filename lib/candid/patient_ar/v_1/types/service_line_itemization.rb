# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class ServiceLineItemization < Internal::Types::Model
          field :service_line_id, -> { String }, optional: false, nullable: false
          field :procedure_code, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :patient_balance_cents, -> { Integer }, optional: false, nullable: false
          field :charge_amount_cents, -> { Integer }, optional: false, nullable: false
          field :insurance_adjustments, -> { Candid::PatientAr::V1::Types::InsuranceAdjustmentInfo }, optional: false, nullable: false
          field :insurance_payments, -> { Candid::PatientAr::V1::Types::InsurancePaymentInfo }, optional: false, nullable: false
          field :non_insurance_adjustments, -> { Candid::PatientAr::V1::Types::NonInsuranceAdjustmentInfo }, optional: false, nullable: false
          field :non_insurance_payments, -> { Candid::PatientAr::V1::Types::NonInsurancePaymentInfo }, optional: false, nullable: false
          field :patient_adjustments, -> { Candid::PatientAr::V1::Types::PatientAdjustmentInfo }, optional: false, nullable: false
          field :patient_payments, -> { Candid::PatientAr::V1::Types::PatientPaymentInfo }, optional: false, nullable: false
          field :copay_cents, -> { Integer }, optional: false, nullable: false
          field :coinsurance_cents, -> { Integer }, optional: false, nullable: false
          field :deductible_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
