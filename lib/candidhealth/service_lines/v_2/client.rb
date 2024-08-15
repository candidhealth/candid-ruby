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
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.create(request: { modifiers: [TWENTY_TWO], charge_amount_cents: 1, diagnosis_id_zero: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_one: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_two: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_three: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", denial_reason: {  }, place_of_service_code: PHARMACY, procedure_code: "string", quantity: "string", units: MJ, claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15) })
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
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.update(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { edit_reason: "string", modifiers: [TWENTY_TWO], charge_amount_cents: 1, diagnosis_id_zero: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_one: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_two: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_three: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", denial_reason: {  }, place_of_service_code: PHARMACY, units: MJ, procedure_code: "string", quantity: "string", description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15) })
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
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.create(request: { modifiers: [TWENTY_TWO], charge_amount_cents: 1, diagnosis_id_zero: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_one: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_two: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_three: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", denial_reason: {  }, place_of_service_code: PHARMACY, procedure_code: "string", quantity: "string", units: MJ, claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15) })
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
        #   * :denial_reason (Hash)
        #     * :reason (CandidApiClient::ServiceLines::V2::Types::DenialReasonContent)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.service_lines.v_2.update(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { edit_reason: "string", modifiers: [TWENTY_TWO], charge_amount_cents: 1, diagnosis_id_zero: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_one: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_two: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", diagnosis_id_three: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", denial_reason: {  }, place_of_service_code: PHARMACY, units: MJ, procedure_code: "string", quantity: "string", description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15) })
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
      end
    end
  end
end
