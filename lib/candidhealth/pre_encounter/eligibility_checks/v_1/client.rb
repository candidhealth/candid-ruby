# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/eligibility_request"
require_relative "types/eligibility_response"
require_relative "types/batch_eligibility_response"
require_relative "types/eligibility_check_page"
require "async"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Sends real-time eligibility checks to payers through Stedi.
          #  <Warning>Please only send one concurrent request to this endpoint. Batch
          #  requests must be made in succession, otherwise, it will cause this service to
          #  fail. A batch endpoint is in development - please reach out to the Candid team
          #  for more information.</Warning>
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest, as a Hash
          #   * :submitter_transaction_identifier (String)
          #   * :payer_id (String)
          #   * :provider (Hash)
          #   * :subscriber (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :dependent (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :encounter (Hash)
          #     * :date_of_service (Date)
          #     * :service_type_codes (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ELIGIBILITY_RESPONSE]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.post(request: { payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } })
          def post(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/eligibility-checks/v1"
            end
            CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck.from_json(json_object: response.body)
          end

          # Sends a batch of eligibility checks to payers through Stedi.
          #
          # @param request [Array<Hash>] Request of type Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest>, as a Hash
          #   * :submitter_transaction_identifier (String)
          #   * :payer_id (String)
          #   * :provider (Hash)
          #   * :subscriber (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :dependent (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :encounter (Hash)
          #     * :date_of_service (Date)
          #     * :service_type_codes (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.batch(request: [{ payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } }, { payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } }])
          def batch(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/eligibility-checks/v1/batch"
            end
            CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse.from_json(json_object: response.body)
          end

          # Polls the status of a batch eligibility check.
          #  <Note>Batch eligibility checks are not yet available. Please reach out to the
          #  Candid team for more information.</Note>
          #  path-parameters:
          #
          # @param batch_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.poll_batch(batch_id: "batch_id")
          def poll_batch(batch_id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/eligibility-checks/v1/batch/#{batch_id}"
            end
            CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.from_json(json_object: response.body)
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Sends real-time eligibility checks to payers through Stedi.
          #  <Warning>Please only send one concurrent request to this endpoint. Batch
          #  requests must be made in succession, otherwise, it will cause this service to
          #  fail. A batch endpoint is in development - please reach out to the Candid team
          #  for more information.</Warning>
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest, as a Hash
          #   * :submitter_transaction_identifier (String)
          #   * :payer_id (String)
          #   * :provider (Hash)
          #   * :subscriber (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :dependent (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :encounter (Hash)
          #     * :date_of_service (Date)
          #     * :service_type_codes (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ELIGIBILITY_RESPONSE]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.post(request: { payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } })
          def post(request:, request_options: nil)
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
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/eligibility-checks/v1"
              end
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck.from_json(json_object: response.body)
            end
          end

          # Sends a batch of eligibility checks to payers through Stedi.
          #
          # @param request [Array<Hash>] Request of type Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest>, as a Hash
          #   * :submitter_transaction_identifier (String)
          #   * :payer_id (String)
          #   * :provider (Hash)
          #   * :subscriber (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :dependent (Hash)
          #     * :member_id (String)
          #     * :first_name (String)
          #     * :last_name (String)
          #     * :date_of_birth (Date)
          #   * :encounter (Hash)
          #     * :date_of_service (Date)
          #     * :service_type_codes (Array<String>)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.batch(request: [{ payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } }, { payer_id: "payer_id", provider: { npi: "npi" }, subscriber: { first_name: "first_name", last_name: "last_name" } }])
          def batch(request:, request_options: nil)
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
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/eligibility-checks/v1/batch"
              end
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse.from_json(json_object: response.body)
            end
          end

          # Polls the status of a batch eligibility check.
          #  <Note>Batch eligibility checks are not yet available. Please reach out to the
          #  Candid team for more information.</Note>
          #  path-parameters:
          #
          # @param batch_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.eligibility_checks.v_1.poll_batch(batch_id: "batch_id")
          def poll_batch(batch_id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/eligibility-checks/v1/batch/#{batch_id}"
              end
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage.from_json(json_object: response.body)
            end
          end
        end
      end
    end
  end
end
