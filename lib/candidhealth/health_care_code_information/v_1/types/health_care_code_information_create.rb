# frozen_string_literal: true

require_relative "principal_diagnosis_new"
require_relative "admitting_diagnosis_new"
require_relative "patient_reason_for_visit_new"
require_relative "external_cause_of_injury_new"
require_relative "diagnosis_related_group_new"
require_relative "other_diagnosis_information_new"
require_relative "principal_procedure_information_new"
require_relative "other_procedure_information_new"
require_relative "occurrence_span_information_new"
require_relative "occurrence_information_new"
require_relative "treatment_code_information_new"
require_relative "value_information_new"
require_relative "condition_information_new"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationCreate
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew]
          attr_reader :principal_diagnosis
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew]
          attr_reader :admitting_diagnosis
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitNew>]
          attr_reader :patient_reasons_for_visit
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryNew>]
          attr_reader :external_causes_of_injury
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew]
          attr_reader :diagnosis_related_groups
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationNew>]
          attr_reader :other_diagnosis_information
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew]
          attr_reader :principal_procedure
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformationNew>]
          attr_reader :other_procedure_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformationNew>]
          attr_reader :occurrence_span_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew>]
          attr_reader :occurrence_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformationNew>]
          attr_reader :treatment_code_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformationNew>]
          attr_reader :value_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationNew>]
          attr_reader :condition_information
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param principal_diagnosis [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew]
          # @param admitting_diagnosis [CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew]
          # @param patient_reasons_for_visit [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitNew>]
          # @param external_causes_of_injury [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryNew>]
          # @param diagnosis_related_groups [CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew]
          # @param other_diagnosis_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationNew>]
          # @param principal_procedure [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew]
          # @param other_procedure_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformationNew>]
          # @param occurrence_span_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformationNew>]
          # @param occurrence_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew>]
          # @param treatment_code_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformationNew>]
          # @param value_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformationNew>]
          # @param condition_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationNew>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate]
          def initialize(principal_diagnosis: OMIT, admitting_diagnosis: OMIT, patient_reasons_for_visit: OMIT,
                         external_causes_of_injury: OMIT, diagnosis_related_groups: OMIT, other_diagnosis_information: OMIT, principal_procedure: OMIT, other_procedure_information: OMIT, occurrence_span_information: OMIT, occurrence_information: OMIT, treatment_code_information: OMIT, value_information: OMIT, condition_information: OMIT, additional_properties: nil)
            @principal_diagnosis = principal_diagnosis if principal_diagnosis != OMIT
            @admitting_diagnosis = admitting_diagnosis if admitting_diagnosis != OMIT
            @patient_reasons_for_visit = patient_reasons_for_visit if patient_reasons_for_visit != OMIT
            @external_causes_of_injury = external_causes_of_injury if external_causes_of_injury != OMIT
            @diagnosis_related_groups = diagnosis_related_groups if diagnosis_related_groups != OMIT
            @other_diagnosis_information = other_diagnosis_information if other_diagnosis_information != OMIT
            @principal_procedure = principal_procedure if principal_procedure != OMIT
            @other_procedure_information = other_procedure_information if other_procedure_information != OMIT
            @occurrence_span_information = occurrence_span_information if occurrence_span_information != OMIT
            @occurrence_information = occurrence_information if occurrence_information != OMIT
            @treatment_code_information = treatment_code_information if treatment_code_information != OMIT
            @value_information = value_information if value_information != OMIT
            @condition_information = condition_information if condition_information != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "principal_diagnosis": principal_diagnosis,
              "admitting_diagnosis": admitting_diagnosis,
              "patient_reasons_for_visit": patient_reasons_for_visit,
              "external_causes_of_injury": external_causes_of_injury,
              "diagnosis_related_groups": diagnosis_related_groups,
              "other_diagnosis_information": other_diagnosis_information,
              "principal_procedure": principal_procedure,
              "other_procedure_information": other_procedure_information,
              "occurrence_span_information": occurrence_span_information,
              "occurrence_information": occurrence_information,
              "treatment_code_information": treatment_code_information,
              "value_information": value_information,
              "condition_information": condition_information
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of HealthCareCodeInformationCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["principal_diagnosis"].nil?
              principal_diagnosis = nil
            else
              principal_diagnosis = parsed_json["principal_diagnosis"].to_json
              principal_diagnosis = CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew.from_json(json_object: principal_diagnosis)
            end
            if parsed_json["admitting_diagnosis"].nil?
              admitting_diagnosis = nil
            else
              admitting_diagnosis = parsed_json["admitting_diagnosis"].to_json
              admitting_diagnosis = CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew.from_json(json_object: admitting_diagnosis)
            end
            patient_reasons_for_visit = parsed_json["patient_reasons_for_visit"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitNew.from_json(json_object: item)
            end
            external_causes_of_injury = parsed_json["external_causes_of_injury"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjuryNew.from_json(json_object: item)
            end
            if parsed_json["diagnosis_related_groups"].nil?
              diagnosis_related_groups = nil
            else
              diagnosis_related_groups = parsed_json["diagnosis_related_groups"].to_json
              diagnosis_related_groups = CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew.from_json(json_object: diagnosis_related_groups)
            end
            other_diagnosis_information = parsed_json["other_diagnosis_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationNew.from_json(json_object: item)
            end
            if parsed_json["principal_procedure"].nil?
              principal_procedure = nil
            else
              principal_procedure = parsed_json["principal_procedure"].to_json
              principal_procedure = CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew.from_json(json_object: principal_procedure)
            end
            other_procedure_information = parsed_json["other_procedure_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformationNew.from_json(json_object: item)
            end
            occurrence_span_information = parsed_json["occurrence_span_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformationNew.from_json(json_object: item)
            end
            occurrence_information = parsed_json["occurrence_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformationNew.from_json(json_object: item)
            end
            treatment_code_information = parsed_json["treatment_code_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformationNew.from_json(json_object: item)
            end
            value_information = parsed_json["value_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformationNew.from_json(json_object: item)
            end
            condition_information = parsed_json["condition_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformationNew.from_json(json_object: item)
            end
            new(
              principal_diagnosis: principal_diagnosis,
              admitting_diagnosis: admitting_diagnosis,
              patient_reasons_for_visit: patient_reasons_for_visit,
              external_causes_of_injury: external_causes_of_injury,
              diagnosis_related_groups: diagnosis_related_groups,
              other_diagnosis_information: other_diagnosis_information,
              principal_procedure: principal_procedure,
              other_procedure_information: other_procedure_information,
              occurrence_span_information: occurrence_span_information,
              occurrence_information: occurrence_information,
              treatment_code_information: treatment_code_information,
              value_information: value_information,
              condition_information: condition_information,
              additional_properties: struct
            )
          end

          # Serialize an instance of HealthCareCodeInformationCreate to a JSON object
          #
          # @return [String]
          def to_json(*_args)
            @_field_set&.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            obj.principal_diagnosis.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisNew.validate_raw(obj: obj.principal_diagnosis)
            obj.admitting_diagnosis.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisNew.validate_raw(obj: obj.admitting_diagnosis)
            obj.patient_reasons_for_visit&.is_a?(Array) != false || raise("Passed value for field obj.patient_reasons_for_visit is not the expected type, validation failed.")
            obj.external_causes_of_injury&.is_a?(Array) != false || raise("Passed value for field obj.external_causes_of_injury is not the expected type, validation failed.")
            obj.diagnosis_related_groups.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupNew.validate_raw(obj: obj.diagnosis_related_groups)
            obj.other_diagnosis_information&.is_a?(Array) != false || raise("Passed value for field obj.other_diagnosis_information is not the expected type, validation failed.")
            obj.principal_procedure.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationNew.validate_raw(obj: obj.principal_procedure)
            obj.other_procedure_information&.is_a?(Array) != false || raise("Passed value for field obj.other_procedure_information is not the expected type, validation failed.")
            obj.occurrence_span_information&.is_a?(Array) != false || raise("Passed value for field obj.occurrence_span_information is not the expected type, validation failed.")
            obj.occurrence_information&.is_a?(Array) != false || raise("Passed value for field obj.occurrence_information is not the expected type, validation failed.")
            obj.treatment_code_information&.is_a?(Array) != false || raise("Passed value for field obj.treatment_code_information is not the expected type, validation failed.")
            obj.value_information&.is_a?(Array) != false || raise("Passed value for field obj.value_information is not the expected type, validation failed.")
            obj.condition_information&.is_a?(Array) != false || raise("Passed value for field obj.condition_information is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
