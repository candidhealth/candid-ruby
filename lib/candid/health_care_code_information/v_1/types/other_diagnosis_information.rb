# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to BF and ABF code qualifier values.
        class OtherDiagnosisInformation < Internal::Types::Model
          field :other_diagnosis_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationCodeQualifier
          }, optional: false, nullable: false
          field :other_diagnosis, -> { String }, optional: false, nullable: false
          field :present_on_admission_indicator, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode
          }, optional: true, nullable: false
        end
      end
    end
  end
end
