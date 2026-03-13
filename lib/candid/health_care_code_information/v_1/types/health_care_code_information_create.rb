# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationCreate < Internal::Types::Model
          field :principal_diagnosis, -> { Candid::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew }, optional: true, nullable: false
          field :other_diagnosis_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationNew] }, optional: true, nullable: false
          field :admitting_diagnosis, -> { Candid::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew }, optional: true, nullable: false
          field :patient_reasons_for_visit, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::PatientReasonForVisitNew] }, optional: true, nullable: false
          field :external_causes_of_injury, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryNew] }, optional: true, nullable: false
          field :diagnosis_related_groups, -> { Candid::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew }, optional: true, nullable: false
          field :principal_procedure, -> { Candid::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew }, optional: true, nullable: false
          field :other_procedure_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherProcedureInformationNew] }, optional: true, nullable: false
          field :occurrence_span_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformationNew] }, optional: true, nullable: false
          field :occurrence_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew] }, optional: true, nullable: false
          field :treatment_code_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::TreatmentCodeInformationNew] }, optional: true, nullable: false
          field :value_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ValueInformationNew] }, optional: true, nullable: false
          field :condition_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ConditionInformationNew] }, optional: true, nullable: false
        end
      end
    end
  end
end
