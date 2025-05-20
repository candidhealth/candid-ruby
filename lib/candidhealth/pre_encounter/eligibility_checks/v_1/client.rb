# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/eligibility_request"
require_relative "types/eligibility_response"
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
        end
      end
    end
  end
end
