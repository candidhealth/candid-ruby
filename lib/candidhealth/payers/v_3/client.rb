# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/payer"
require_relative "types/payer_page"
require "async"

module CandidApiClient
  module Payers
    module V3
      class V3Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Payers::V3::V3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param payer_uuid [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Payers::V3::Types::Payer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.payers.v_3.get(payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(payer_uuid:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/payers/v3/#{payer_uuid}"
          end
          CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: response.body)
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param search_term [String]
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Payers::V3::Types::PayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.payers.v_3.get_all(
        #    limit: 100,
        #    search_term: "john",
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_all(limit: nil, search_term: nil, page_token: nil, request_options: nil)
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
              "search_term": search_term,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi, request_options: request_options)}/api/payers/v3"
          end
          CandidApiClient::Payers::V3::Types::PayerPage.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Payers::V3::AsyncV3Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param payer_uuid [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Payers::V3::Types::Payer]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.payers.v_3.get(payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(payer_uuid:, request_options: nil)
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
                                                 request_options: request_options)}/api/payers/v3/#{payer_uuid}"
            end
            CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param search_term [String]
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Payers::V3::Types::PayerPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.payers.v_3.get_all(
        #    limit: 100,
        #    search_term: "john",
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_all(limit: nil, search_term: nil, page_token: nil, request_options: nil)
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
                "search_term": search_term,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/payers/v3"
            end
            CandidApiClient::Payers::V3::Types::PayerPage.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
