# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/health_care_code_information_update"
require_relative "types/health_care_code_information_get_all_response"
require "async"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate, as a Hash
        #   * :principal_diagnosis (Hash)
        #     * :value (Hash)
        #       * :principal_diagnosis_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisCodeQualifier)
        #       * :primary_diagnosis_code (String)
        #       * :present_on_admission_indicator (CandidApiClient::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :admitting_diagnosis (Hash)
        #     * :value (Hash)
        #       * :admitting_diagnosis_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisCodeQualifier)
        #       * :admitting_diagnosis_code (String)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :patient_reasons_for_visit (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit>)
        #   * :external_causes_of_injury (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury>)
        #   * :diagnosis_related_groups (Hash)
        #     * :value (Hash)
        #       * :diagnosis_related_group_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupCodeQualifier)
        #       * :diagnosis_related_group_code (String)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :other_diagnosis_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation>)
        #   * :principal_procedure (Hash)
        #     * :value (Hash)
        #       * :principal_procedure_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier)
        #       * :principal_procedure_code (String)
        #       * :procedure_date (DateTime)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :other_procedure_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformation>)
        #   * :occurrence_span_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation>)
        #   * :occurrence_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformation>)
        #   * :treatment_code_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation>)
        #   * :value_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation>)
        #   * :condition_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.health_care_code_information.v_1.update(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.put do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/health-care-code-informations/v1/#{encounter_id}"
          end
          CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.health_care_code_information.v_1.get_all_for_encounter(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_all_for_encounter(encounter_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/health-care-code-informations/v1/#{encounter_id}"
          end
          CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate, as a Hash
        #   * :principal_diagnosis (Hash)
        #     * :value (Hash)
        #       * :principal_diagnosis_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalDiagnosisCodeQualifier)
        #       * :primary_diagnosis_code (String)
        #       * :present_on_admission_indicator (CandidApiClient::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :admitting_diagnosis (Hash)
        #     * :value (Hash)
        #       * :admitting_diagnosis_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosisCodeQualifier)
        #       * :admitting_diagnosis_code (String)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :patient_reasons_for_visit (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit>)
        #   * :external_causes_of_injury (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ExternalCauseOfInjury>)
        #   * :diagnosis_related_groups (Hash)
        #     * :value (Hash)
        #       * :diagnosis_related_group_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupCodeQualifier)
        #       * :diagnosis_related_group_code (String)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :other_diagnosis_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation>)
        #   * :principal_procedure (Hash)
        #     * :value (Hash)
        #       * :principal_procedure_code_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier)
        #       * :principal_procedure_code (String)
        #       * :procedure_date (DateTime)
        #       * :id (String)
        #       * :encounter_id (String)
        #       * :code_list_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::CodeListQualifierCode)
        #       * :industry_code_1 (String)
        #       * :industry_code_2 (String)
        #       * :industry_code_3 (String)
        #       * :industry_code_4 (String)
        #       * :date_time_period_format_qualifier (CandidApiClient::HealthCareCodeInformation::V1::Types::DateTimePeriodFormatQualifier)
        #       * :date_time_period (String)
        #       * :monetary_amount (String)
        #       * :quantity (String)
        #   * :other_procedure_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OtherProcedureInformation>)
        #   * :occurrence_span_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceSpanInformation>)
        #   * :occurrence_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::OccurrenceInformation>)
        #   * :treatment_code_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::TreatmentCodeInformation>)
        #   * :value_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ValueInformation>)
        #   * :condition_information (Array<CandidApiClient::HealthCareCodeInformation::V1::Types::ConditionInformation>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.health_care_code_information.v_1.update(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/health-care-code-informations/v1/#{encounter_id}"
            end
            CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.health_care_code_information.v_1.get_all_for_encounter(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get_all_for_encounter(encounter_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/health-care-code-informations/v1/#{encounter_id}"
            end
            CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
