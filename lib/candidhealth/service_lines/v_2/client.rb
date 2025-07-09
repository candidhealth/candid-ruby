# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/service_line_create_standalone"
require_relative "types/service_line"
require_relative "types/service_line_update"
require "async"

module CandidApiClient
  module ServiceLines
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ServiceLines::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateStandalone, as a Hash
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_id_zero (String)
        #   * :diagnosis_id_one (String)
        #   * :diagnosis_id_two (String)
        #   * :diagnosis_id_three (String)
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :claim_id (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :ordering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :test_results (Array<CandidApiClient::ServiceLines::V2::Types::TestResult>)
        #   * :has_epsdt_indicator (Boolean)
        #   * :has_family_planning_indicator (Boolean)
        #   * :note (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.create(request: { procedure_code: "procedure_code", quantity: "quantity", units: MJ, claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32" })
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
                                               request_options: request_options)}/api/service-lines/v2"
          end
          CandidApiClient::ServiceLines::V2::Types::ServiceLine.from_json(json_object: response.body)
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::ServiceLines::V2::Types::ServiceLineUpdate, as a Hash
        #   * :edit_reason (String)
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_id_zero (String)
        #   * :diagnosis_id_one (String)
        #   * :diagnosis_id_two (String)
        #   * :diagnosis_id_three (String)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :test_results (Array<CandidApiClient::ServiceLines::V2::Types::TestResult>)
        #   * :has_epsdt_indicator (Boolean)
        #   * :has_family_planning_indicator (Boolean)
        #   * :note (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.update(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(service_line_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/service-lines/v2/#{service_line_id}"
          end
          CandidApiClient::ServiceLines::V2::Types::ServiceLine.from_json(json_object: response.body)
        end

        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.delete(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(service_line_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/service-lines/v2/#{service_line_id}"
          end
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ServiceLines::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param request [Hash] Request of type CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateStandalone, as a Hash
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_id_zero (String)
        #   * :diagnosis_id_one (String)
        #   * :diagnosis_id_two (String)
        #   * :diagnosis_id_three (String)
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :claim_id (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :ordering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :test_results (Array<CandidApiClient::ServiceLines::V2::Types::TestResult>)
        #   * :has_epsdt_indicator (Boolean)
        #   * :has_family_planning_indicator (Boolean)
        #   * :note (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.create(request: { procedure_code: "procedure_code", quantity: "quantity", units: MJ, claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32" })
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
                                                 request_options: request_options)}/api/service-lines/v2"
            end
            CandidApiClient::ServiceLines::V2::Types::ServiceLine.from_json(json_object: response.body)
          end
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::ServiceLines::V2::Types::ServiceLineUpdate, as a Hash
        #   * :edit_reason (String)
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_id_zero (String)
        #   * :diagnosis_id_one (String)
        #   * :diagnosis_id_two (String)
        #   * :diagnosis_id_three (String)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #     * :drug_description (String)
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :test_results (Array<CandidApiClient::ServiceLines::V2::Types::TestResult>)
        #   * :has_epsdt_indicator (Boolean)
        #   * :has_family_planning_indicator (Boolean)
        #   * :note (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.update(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(service_line_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/service-lines/v2/#{service_line_id}"
            end
            CandidApiClient::ServiceLines::V2::Types::ServiceLine.from_json(json_object: response.body)
          end
        end

        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.delete(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(service_line_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/service-lines/v2/#{service_line_id}"
            end
          end
        end
      end
    end
  end
end
