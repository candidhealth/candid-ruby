# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/payer_uuid"
require_relative "types/payer"
require_relative "../../commons/types/page_token"
require_relative "types/payer_page"
require "async"

module CandidApiClient
  module Payers
    module V3
      class V3Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Payers::V3::V3Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param request_options [RequestOptions]
        # @return [Payers::V3::Payer]
        def get(payer_uuid:, request_options: nil)
          response = @request_client.conn.get("/api/payers/v3/#{payer_uuid}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Payers::V3::Payer.from_json(json_object: response.body)
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param search_term [String]
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [Payers::V3::PayerPage]
        def get_all(limit: nil, search_term: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get("/api/payers/v3") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "search_term": search_term,
              "page_token": page_token
            }.compact
          end
          Payers::V3::PayerPage.from_json(json_object: response.body)
        end
      end

      class AsyncV3Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Payers::V3::AsyncV3Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param payer_uuid [Payers::V3::PAYER_UUID]
        # @param request_options [RequestOptions]
        # @return [Payers::V3::Payer]
        def get(payer_uuid:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/payers/v3/#{payer_uuid}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Payers::V3::Payer.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param search_term [String]
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [Payers::V3::PayerPage]
        def get_all(limit: nil, search_term: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/payers/v3") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "search_term": search_term,
                "page_token": page_token
              }.compact
            end
            Payers::V3::PayerPage.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
