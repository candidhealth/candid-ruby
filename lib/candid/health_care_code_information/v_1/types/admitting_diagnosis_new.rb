# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to BJ or ABJ code qualifier values.
        class AdmittingDiagnosisNew < Internal::Types::Model
          field :admitting_diagnosis_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisCodeQualifier
          }, optional: false, nullable: false
          field :admitting_diagnosis_code, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
