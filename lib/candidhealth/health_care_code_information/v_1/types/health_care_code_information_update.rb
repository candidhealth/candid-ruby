# frozen_string_literal: true

require_relative "set_or_clear_principal_diagnosis"
require_relative "other_diagnosis_information"
require_relative "set_or_clear_admitting_diagnosis"
require_relative "patient_reason_for_visit"
require_relative "external_cause_of_injury"
require_relative "set_or_clear_diagnosis_related_group"
require_relative "set_or_clear_principal_procedure_information"
require_relative "other_procedure_information"
require_relative "occurrence_span_information"
require_relative "occurrence_information"
require_relative "treatment_code_information"
require_relative "value_information"
require_relative "condition_information"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformationUpdate
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalDiagnosis] Set & Replace semantics.  If the id matches the existing principal_diagnosis,
          #  that diagnosis is updated in place.  If the entry has no id, it is created
          #  newly, its id will be in the response, and any existing principal_diagnosis is
          #  deleted and removed from any service line pointers.
          attr_reader :principal_diagnosis
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  other_diagnosis_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted, including having
          #  it removed from any service line pointers.
          attr_reader :other_diagnosis_information
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis] Set & Replace semantics.  If the id matches the existing admitting_diagnosis,
          #  that diagnosis is updated in place.  If the entry has no id, it is created
          #  newly, its id will be in the response, and any existing principal_diagnosis is
          #  deleted. This object only applies to 837i institutional claim forms.
          attr_reader :admitting_diagnosis
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit>] Set & Replace semantics.  For each entry that has an id, any previous
          #  patient_reasons_for_visit by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :patient_reasons_for_visit
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury>] Set & Replace semantics.  For each entry that has an id, any previous
          #  external_causes_of_injury by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :external_causes_of_injury
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearDiagnosisRelatedGroup] Set & Replace semantics.  If the id matches the existing
          #  diagnosis_related_groups, that diagnosis_related_group is updated in place.  If
          #  the entry has no id, it is created newly, its id will be in the response, and
          #  any existing diagnosis_related_groups is deleted. This object only applies to
          #  837i institutional claim forms.
          attr_reader :diagnosis_related_groups
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalProcedureInformation] Set & Replace semantics.  If the id matches the existing principal_procedure,
          #  that principal_procedure is updated in place.  If the entry has no id, it is
          #  created newly, its id will be in the response, and any existing
          #  principal_procedure is deleted. This object only applies to 837i institutional
          #  claim forms.
          attr_reader :principal_procedure
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  other_procedure_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :other_procedure_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  occurrence_span_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :occurrence_span_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  occurrence_information by that id is updated in place.  For each entry without
          #  an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :occurrence_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  treatment_code_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          attr_reader :treatment_code_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  value_information by that id is updated in place.  For each entry without an id,
          #  it is created newly and its id will be in the response.  For each existing entry
          #  that was not referred to by id, it is deleted. This object only applies to 837i
          #  institutional claim forms.
          attr_reader :value_information
          # @return [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  condition_information by that id is updated in place.  For each entry without an
          #  id, it is created newly and its id will be in the response.  For each existing
          #  entry that was not referred to by id, it is deleted. This object only applies to
          #  837i institutional claim forms.
          attr_reader :condition_information
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param principal_diagnosis [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalDiagnosis] Set & Replace semantics.  If the id matches the existing principal_diagnosis,
          #  that diagnosis is updated in place.  If the entry has no id, it is created
          #  newly, its id will be in the response, and any existing principal_diagnosis is
          #  deleted and removed from any service line pointers.
          # @param other_diagnosis_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  other_diagnosis_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted, including having
          #  it removed from any service line pointers.
          # @param admitting_diagnosis [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis] Set & Replace semantics.  If the id matches the existing admitting_diagnosis,
          #  that diagnosis is updated in place.  If the entry has no id, it is created
          #  newly, its id will be in the response, and any existing principal_diagnosis is
          #  deleted. This object only applies to 837i institutional claim forms.
          # @param patient_reasons_for_visit [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit>] Set & Replace semantics.  For each entry that has an id, any previous
          #  patient_reasons_for_visit by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param external_causes_of_injury [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury>] Set & Replace semantics.  For each entry that has an id, any previous
          #  external_causes_of_injury by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param diagnosis_related_groups [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearDiagnosisRelatedGroup] Set & Replace semantics.  If the id matches the existing
          #  diagnosis_related_groups, that diagnosis_related_group is updated in place.  If
          #  the entry has no id, it is created newly, its id will be in the response, and
          #  any existing diagnosis_related_groups is deleted. This object only applies to
          #  837i institutional claim forms.
          # @param principal_procedure [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalProcedureInformation] Set & Replace semantics.  If the id matches the existing principal_procedure,
          #  that principal_procedure is updated in place.  If the entry has no id, it is
          #  created newly, its id will be in the response, and any existing
          #  principal_procedure is deleted. This object only applies to 837i institutional
          #  claim forms.
          # @param other_procedure_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  other_procedure_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param occurrence_span_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  occurrence_span_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param occurrence_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  occurrence_information by that id is updated in place.  For each entry without
          #  an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param treatment_code_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  treatment_code_information by that id is updated in place.  For each entry
          #  without an id, it is created newly and its id will be in the response.  For each
          #  existing entry that was not referred to by id, it is deleted. This object only
          #  applies to 837i institutional claim forms.
          # @param value_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  value_information by that id is updated in place.  For each entry without an id,
          #  it is created newly and its id will be in the response.  For each existing entry
          #  that was not referred to by id, it is deleted. This object only applies to 837i
          #  institutional claim forms.
          # @param condition_information [Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation>] Set & Replace semantics.  For each entry that has an id, any previous
          #  condition_information by that id is updated in place.  For each entry without an
          #  id, it is created newly and its id will be in the response.  For each existing
          #  entry that was not referred to by id, it is deleted. This object only applies to
          #  837i institutional claim forms.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate]
          def initialize(principal_diagnosis: OMIT, other_diagnosis_information: OMIT, admitting_diagnosis: OMIT,
                         patient_reasons_for_visit: OMIT, external_causes_of_injury: OMIT, diagnosis_related_groups: OMIT, principal_procedure: OMIT, other_procedure_information: OMIT, occurrence_span_information: OMIT, occurrence_information: OMIT, treatment_code_information: OMIT, value_information: OMIT, condition_information: OMIT, additional_properties: nil)
            @principal_diagnosis = principal_diagnosis if principal_diagnosis != OMIT
            @other_diagnosis_information = other_diagnosis_information if other_diagnosis_information != OMIT
            @admitting_diagnosis = admitting_diagnosis if admitting_diagnosis != OMIT
            @patient_reasons_for_visit = patient_reasons_for_visit if patient_reasons_for_visit != OMIT
            @external_causes_of_injury = external_causes_of_injury if external_causes_of_injury != OMIT
            @diagnosis_related_groups = diagnosis_related_groups if diagnosis_related_groups != OMIT
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
              "other_diagnosis_information": other_diagnosis_information,
              "admitting_diagnosis": admitting_diagnosis,
              "patient_reasons_for_visit": patient_reasons_for_visit,
              "external_causes_of_injury": external_causes_of_injury,
              "diagnosis_related_groups": diagnosis_related_groups,
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

          # Deserialize a JSON object to an instance of HealthCareCodeInformationUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["principal_diagnosis"].nil?
              principal_diagnosis = nil
            else
              principal_diagnosis = parsed_json["principal_diagnosis"].to_json
              principal_diagnosis = CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalDiagnosis.from_json(json_object: principal_diagnosis)
            end
            other_diagnosis_information = parsed_json["other_diagnosis_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation.from_json(json_object: item)
            end
            if parsed_json["admitting_diagnosis"].nil?
              admitting_diagnosis = nil
            else
              admitting_diagnosis = parsed_json["admitting_diagnosis"].to_json
              admitting_diagnosis = CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis.from_json(json_object: admitting_diagnosis)
            end
            patient_reasons_for_visit = parsed_json["patient_reasons_for_visit"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit.from_json(json_object: item)
            end
            external_causes_of_injury = parsed_json["external_causes_of_injury"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury.from_json(json_object: item)
            end
            if parsed_json["diagnosis_related_groups"].nil?
              diagnosis_related_groups = nil
            else
              diagnosis_related_groups = parsed_json["diagnosis_related_groups"].to_json
              diagnosis_related_groups = CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearDiagnosisRelatedGroup.from_json(json_object: diagnosis_related_groups)
            end
            if parsed_json["principal_procedure"].nil?
              principal_procedure = nil
            else
              principal_procedure = parsed_json["principal_procedure"].to_json
              principal_procedure = CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalProcedureInformation.from_json(json_object: principal_procedure)
            end
            other_procedure_information = parsed_json["other_procedure_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformation.from_json(json_object: item)
            end
            occurrence_span_information = parsed_json["occurrence_span_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation.from_json(json_object: item)
            end
            occurrence_information = parsed_json["occurrence_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformation.from_json(json_object: item)
            end
            treatment_code_information = parsed_json["treatment_code_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation.from_json(json_object: item)
            end
            value_information = parsed_json["value_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation.from_json(json_object: item)
            end
            condition_information = parsed_json["condition_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation.from_json(json_object: item)
            end
            new(
              principal_diagnosis: principal_diagnosis,
              other_diagnosis_information: other_diagnosis_information,
              admitting_diagnosis: admitting_diagnosis,
              patient_reasons_for_visit: patient_reasons_for_visit,
              external_causes_of_injury: external_causes_of_injury,
              diagnosis_related_groups: diagnosis_related_groups,
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

          # Serialize an instance of HealthCareCodeInformationUpdate to a JSON object
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
            obj.principal_diagnosis.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalDiagnosis.validate_raw(obj: obj.principal_diagnosis)
            obj.other_diagnosis_information&.is_a?(Array) != false || raise("Passed value for field obj.other_diagnosis_information is not the expected type, validation failed.")
            obj.admitting_diagnosis.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis.validate_raw(obj: obj.admitting_diagnosis)
            obj.patient_reasons_for_visit&.is_a?(Array) != false || raise("Passed value for field obj.patient_reasons_for_visit is not the expected type, validation failed.")
            obj.external_causes_of_injury&.is_a?(Array) != false || raise("Passed value for field obj.external_causes_of_injury is not the expected type, validation failed.")
            obj.diagnosis_related_groups.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearDiagnosisRelatedGroup.validate_raw(obj: obj.diagnosis_related_groups)
            obj.principal_procedure.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearPrincipalProcedureInformation.validate_raw(obj: obj.principal_procedure)
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
