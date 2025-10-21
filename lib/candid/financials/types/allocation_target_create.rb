# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Allocation targets describe whether the portion of a payment is being applied toward a specific service line,
      # claim, billing provider, or is unallocated.
      class AllocationTargetCreate < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { String }, key: "SERVICE_LINE_BY_ID"
        member -> { String }, key: "CLAIM_BY_ID"
        member -> { String }, key: "CLAIM_BY_ENCOUNTER_EXTERNAL_ID"
        member -> { String }, key: "BILLING_PROVIDER_BY_ID"
        member -> { Candid::Financials::Types::AppointmentByIdAndPatientExternalId }, key: "APPOINTMENT_BY_ID_AND_PATIENT_EXTERNAL_ID"
        member -> { Object }, key: "UNATTRIBUTED"
      end
    end
  end
end
