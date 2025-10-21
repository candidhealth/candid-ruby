# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationGetAllResponse < Internal::Types::Model
          field :principal_diagnosis, -> { Candid::HealthCareCodeInformation::V1::Types::PrincipalDiagnosis }, optional: true, nullable: false
          field :other_diagnosis_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation] }, optional: false, nullable: false
          field :admitting_diagnosis, -> { Candid::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis }, optional: true, nullable: false
          field :patient_reasons_for_visit, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::PatientReasonForVisit] }, optional: false, nullable: false
          field :external_causes_of_injury, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury] }, optional: false, nullable: false
          field :diagnosis_related_groups, -> { Candid::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroup }, optional: true, nullable: false
          field :principal_procedure, -> { Candid::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformation }, optional: true, nullable: false
          field :other_procedure_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OtherProcedureInformation] }, optional: false, nullable: false
          field :occurrence_span_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation] }, optional: false, nullable: false
          field :occurrence_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::OccurrenceInformation] }, optional: false, nullable: false
          field :treatment_code_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation] }, optional: false, nullable: false
          field :value_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ValueInformation] }, optional: false, nullable: false
          field :condition_information, -> { Internal::Types::Array[Candid::HealthCareCodeInformation::V1::Types::ConditionInformation] }, optional: false, nullable: false

        end
      end
    end
  end
end
