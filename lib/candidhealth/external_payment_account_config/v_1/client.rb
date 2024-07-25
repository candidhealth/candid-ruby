# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/external_payment_account_config_page"
require "async"

module CandidApiClient
  module ExternalPaymentAccountConfig
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.external_payment_account_config.v_1.get_multi(limit: 1, page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9")
        def get_multi(limit: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/external-payment-account-config/v1"
          end
          CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param limit [Integer] Defaults to 100
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.external_payment_account_config.v_1.get_multi(limit: 1, page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9")
        def get_multi(limit: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/external-payment-account-config/v1"
            end
            CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
