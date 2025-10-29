# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationUpdate < Internal::Types::Model
          field :principal_diagnosis, lambda {
            Candid::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalDiagnosis
          }, optional: true, nullable: false
          field :other_diagnosis_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation]
          }, optional: true, nullable: false
          field :admitting_diagnosis, lambda {
            Candid::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis
          }, optional: true, nullable: false
          field :patient_reasons_for_visit, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::PatientReasonForVisit]
          }, optional: true, nullable: false
          field :external_causes_of_injury, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury]
          }, optional: true, nullable: false
          field :diagnosis_related_groups, lambda {
            Candid::HealthCareCodeInformation::V1::Types::SetOrClearDiagnosisRelatedGroup
          }, optional: true, nullable: false
          field :principal_procedure, lambda {
            Candid::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalProcedureInformation
          }, optional: true, nullable: false
          field :other_procedure_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherProcedureInformation]
          }, optional: true, nullable: false
          field :occurrence_span_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation]
          }, optional: true, nullable: false
          field :occurrence_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceInformation]
          }, optional: true, nullable: false
          field :treatment_code_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation]
          }, optional: true, nullable: false
          field :value_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ValueInformation]
          }, optional: true, nullable: false
          field :condition_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ConditionInformation]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
