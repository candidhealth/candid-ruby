# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/insurance_adjudication"
require_relative "types/insurance_adjudication_create"
require "async"

module CandidApiClient
  module InsuranceAdjudications
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::InsuranceAdjudications::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Retrieves a previously created insurance adjudication by its
        #  `insurance_adjudication_id`.
        #
        # @param insurance_adjudication_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.get(insurance_adjudication_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(insurance_adjudication_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1/#{insurance_adjudication_id}"
          end
          CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication.from_json(json_object: response.body)
        end

        # Creates a new insurance adjudication record and returns the newly created
        #  InsuranceAdjudication object.
        #
        # @param request [Hash] Request of type CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :payee (Hash)
        #     * :payee_name (String)
        #     * :payee_identifier (Hash)
        #   * :post_date (Date)
        #   * :check_number (String)
        #   * :check_date (Date)
        #   * :note (String)
        #   * :claims (Hash{String => Array})
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.create(request: { payee: {  }, post_date: DateTime.parse(2023-01-15), check_number: "string", check_date: DateTime.parse(2023-01-15), note: "string", claims: { "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32": [{  }] } })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1"
          end
          CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication.from_json(json_object: response.body)
        end

        # Deletes the insurance adjudication record matching the provided
        #  insurance_adjudication_id.
        #
        # @param insurance_adjudication_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.delete(insurance_adjudication_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(insurance_adjudication_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1/#{insurance_adjudication_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::InsuranceAdjudications::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Retrieves a previously created insurance adjudication by its
        #  `insurance_adjudication_id`.
        #
        # @param insurance_adjudication_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.get(insurance_adjudication_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(insurance_adjudication_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1/#{insurance_adjudication_id}"
            end
            CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication.from_json(json_object: response.body)
          end
        end

        # Creates a new insurance adjudication record and returns the newly created
        #  InsuranceAdjudication object.
        #
        # @param request [Hash] Request of type CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate, as a Hash
        #   * :payer_identifier (Hash)
        #   * :payee (Hash)
        #     * :payee_name (String)
        #     * :payee_identifier (Hash)
        #   * :post_date (Date)
        #   * :check_number (String)
        #   * :check_date (Date)
        #   * :note (String)
        #   * :claims (Hash{String => Array})
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.create(request: { payee: {  }, post_date: DateTime.parse(2023-01-15), check_number: "string", check_date: DateTime.parse(2023-01-15), note: "string", claims: { "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32": [{  }] } })
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
              req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1"
            end
            CandidApiClient::InsuranceAdjudications::V1::Types::InsuranceAdjudication.from_json(json_object: response.body)
          end
        end

        # Deletes the insurance adjudication record matching the provided
        #  insurance_adjudication_id.
        #
        # @param insurance_adjudication_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_adjudications.v_1.delete(insurance_adjudication_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(insurance_adjudication_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/insurance-adjudications/v1/#{insurance_adjudication_id}"
            end
          end
        end
      end
    end
  end
end
