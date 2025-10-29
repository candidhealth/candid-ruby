# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to BK or ABK code qualifier values.
        class PrincipalDiagnosis < Internal::Types::Model
          field :principal_diagnosis_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisCodeQualifier
          }, optional: false, nullable: false
          field :primary_diagnosis_code, -> { String }, optional: false, nullable: false
          field :present_on_admission_indicator, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode
          }, optional: true, nullable: false
        end
      end
    end
  end
end
