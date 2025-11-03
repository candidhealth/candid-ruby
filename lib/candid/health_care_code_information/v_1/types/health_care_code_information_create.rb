# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationCreate < Internal::Types::Model
          field :principal_diagnosis, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew
          }, optional: true, nullable: false
          field :other_diagnosis_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationNew]
          }, optional: true, nullable: false
          field :admitting_diagnosis, lambda {
            Candid::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew
          }, optional: true, nullable: false
          field :patient_reasons_for_visit, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::PatientReasonForVisitNew]
          }, optional: true, nullable: false
          field :external_causes_of_injury, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryNew]
          }, optional: true, nullable: false
          field :diagnosis_related_groups, lambda {
            Candid::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew
          }, optional: true, nullable: false
          field :principal_procedure, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew
          }, optional: true, nullable: false
          field :other_procedure_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherProcedureInformationNew]
          }, optional: true, nullable: false
          field :occurrence_span_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformationNew]
          }, optional: true, nullable: false
          field :occurrence_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew]
          }, optional: true, nullable: false
          field :treatment_code_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::TreatmentCodeInformationNew]
          }, optional: true, nullable: false
          field :value_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ValueInformationNew]
          }, optional: true, nullable: false
          field :condition_information, lambda {
            Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ConditionInformationNew]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
