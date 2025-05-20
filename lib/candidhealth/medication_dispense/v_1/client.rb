# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/medication_dispense_create"
require_relative "../../encounters/v_4/types/encounter"
require "async"

module CandidApiClient
  module MedicationDispense
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::MedicationDispense::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::MedicationDispense::V1::Types::MedicationDispenseCreate, as a Hash
        #   * :medication_dispense_external_id (String)
        #   * :patient_external_id (String)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :date_of_service (Date)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :description (String)
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.medication_dispense.v_1.create(request: { medication_dispense_external_id: "medication_dispense_external_id", patient_external_id: "patient_external_id", procedure_code: "procedure_code", quantity: "quantity", units: MJ, date_of_service: DateTime.parse(2023-01-15) })
        def create(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/medication-dispense/v1"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::MedicationDispense::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::MedicationDispense::V1::Types::MedicationDispenseCreate, as a Hash
        #   * :medication_dispense_external_id (String)
        #   * :patient_external_id (String)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :date_of_service (Date)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :description (String)
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.medication_dispense.v_1.create(request: { medication_dispense_external_id: "medication_dispense_external_id", patient_external_id: "patient_external_id", procedure_code: "procedure_code", quantity: "quantity", units: MJ, date_of_service: DateTime.parse(2023-01-15) })
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/medication-dispense/v1"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
