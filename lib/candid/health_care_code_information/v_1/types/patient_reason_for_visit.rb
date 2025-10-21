# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to PR or APR code qualifier values.
        class PatientReasonForVisit < Internal::Types::Model
          field :patient_reason_for_visit_code_qualifier, -> { Candid::HealthCareCodeInformation::V1::Types::PatientReasonForVisitCodeQualifier }, optional: false, nullable: false
          field :patient_reason_for_visit, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
