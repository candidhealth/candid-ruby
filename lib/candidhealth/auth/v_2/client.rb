# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/auth_get_token_response"
require "async"

module CandidApiClient
  module Auth
    module V2
      class V2Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Auth::V2::V2Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Authenticating with the Candid Health API.
        #
        # Candid Health utilizes the [OAuth 2.0 bearer token authentication scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our auth flow. You obtain the bearer token for all
        # subsequent API requests via the `/auth/token` endpoint defined below, which requires you to provide your `client_id` and `client_secret`. Your `client_id` and `client_secret` can be [generated](https://support.joincandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys) from the "Users & Credentials" tab by your org admin.
        #
        # The bearer token should be provided in the `Authorization` header for all subsequent API calls.
        #
        # **Warning:**
        #
        # The bearer token expires 5 hours after it has been created. After it has expired, the client will receive an "HTTP 401
        # Unauthorized" error, at which point the client should generate a new token. It is important that tokens be reused between requests; if the client attempts to generate a token too often, it will be rate-limited and will receive an "HTTP 429 Too Many Requests" error.
        #
        # @param client_id [String] Your application's Client ID.
        # @param client_secret [String] Your application's Client Secret.
        # @param request_options [RequestOptions]
        # @return [Auth::V2::AuthGetTokenResponse]
        def get_token(client_id:, client_secret:, request_options: nil)
          response = @request_client.conn.post("/api/auth/v2/token") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              client_id: client_id,
              client_secret: client_secret
            }.compact
          end
          Auth::V2::AuthGetTokenResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Auth::V2::AsyncV2Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Authenticating with the Candid Health API.
        #
        # Candid Health utilizes the [OAuth 2.0 bearer token authentication scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our auth flow. You obtain the bearer token for all
        # subsequent API requests via the `/auth/token` endpoint defined below, which requires you to provide your `client_id` and `client_secret`. Your `client_id` and `client_secret` can be [generated](https://support.joincandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys) from the "Users & Credentials" tab by your org admin.
        #
        # The bearer token should be provided in the `Authorization` header for all subsequent API calls.
        #
        # **Warning:**
        #
        # The bearer token expires 5 hours after it has been created. After it has expired, the client will receive an "HTTP 401
        # Unauthorized" error, at which point the client should generate a new token. It is important that tokens be reused between requests; if the client attempts to generate a token too often, it will be rate-limited and will receive an "HTTP 429 Too Many Requests" error.
        #
        # @param client_id [String] Your application's Client ID.
        # @param client_secret [String] Your application's Client Secret.
        # @param request_options [RequestOptions]
        # @return [Auth::V2::AuthGetTokenResponse]
        def get_token(client_id:, client_secret:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/auth/v2/token") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                client_id: client_id,
                client_secret: client_secret
              }.compact
            end
            Auth::V2::AuthGetTokenResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
