# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/auth_get_token_response"
require "async"

module CandidApiClient
  module Auth
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Auth::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Callout intent="info">
        #  Candid Health SDKs automatically handle authentication workflows after
        #  configuring them with the `client_id` and
        #  `client_secret`.
        #  </Callout>
        #  Candid Health utilizes the [OAuth 2.0 bearer token authentication
        #  scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our
        #  auth flow. You obtain the bearer token for all
        #  subsequent API requests via the `/auth/token` endpoint defined below, which
        #  requires you to provide your `client_id` and `client_secret`. Your `client_id`
        #  and `client_secret` can be
        #  incandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys)
        #  from the "Users & Credentials" tab by your org admin.
        #  The bearer token is a signed [JWT](https://jwt.io/). The public key for the JWT
        #  can be found [here](https://candidhealth.auth0.com/pem) for any verification
        #  workflows.
        #  The bearer token should be provided in the `Authorization` header for all
        #  subsequent API calls.
        #  <Callout intent="warning">
        #  The bearer token expires 5 hours after it has been created. After it has
        #  expired, the client will receive an "HTTP 401
        #  Unauthorized" error, at which point the client should generate a new token. It
        #  is important that tokens be reused between
        #  requests; if the client attempts to generate a token too often, it will be
        #  rate-limited and will receive an `HTTP 429 Too Many Requests` error.
        #  </Callout>
        #
        # @param client_id [String] Your application's Client ID.
        # @param client_secret [String] Your application's Client Secret.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Auth::V2::Types::AuthGetTokenResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.auth.v_2.get_token(client_id: "YOUR_CLIENT_ID", client_secret: "YOUR_CLIENT_SECRET")
        def get_token(client_id:, client_secret:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              client_id: client_id,
              client_secret: client_secret
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/auth/v2/token"
          end
          CandidApiClient::Auth::V2::Types::AuthGetTokenResponse.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Auth::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # <Callout intent="info">
        #  Candid Health SDKs automatically handle authentication workflows after
        #  configuring them with the `client_id` and
        #  `client_secret`.
        #  </Callout>
        #  Candid Health utilizes the [OAuth 2.0 bearer token authentication
        #  scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our
        #  auth flow. You obtain the bearer token for all
        #  subsequent API requests via the `/auth/token` endpoint defined below, which
        #  requires you to provide your `client_id` and `client_secret`. Your `client_id`
        #  and `client_secret` can be
        #  incandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys)
        #  from the "Users & Credentials" tab by your org admin.
        #  The bearer token is a signed [JWT](https://jwt.io/). The public key for the JWT
        #  can be found [here](https://candidhealth.auth0.com/pem) for any verification
        #  workflows.
        #  The bearer token should be provided in the `Authorization` header for all
        #  subsequent API calls.
        #  <Callout intent="warning">
        #  The bearer token expires 5 hours after it has been created. After it has
        #  expired, the client will receive an "HTTP 401
        #  Unauthorized" error, at which point the client should generate a new token. It
        #  is important that tokens be reused between
        #  requests; if the client attempts to generate a token too often, it will be
        #  rate-limited and will receive an `HTTP 429 Too Many Requests` error.
        #  </Callout>
        #
        # @param client_id [String] Your application's Client ID.
        # @param client_secret [String] Your application's Client Secret.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Auth::V2::Types::AuthGetTokenResponse]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
        #  api.auth.v_2.get_token(client_id: "YOUR_CLIENT_ID", client_secret: "YOUR_CLIENT_SECRET")
        def get_token(client_id:, client_secret:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                client_id: client_id,
                client_secret: client_secret
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/auth/v2/token"
            end
            CandidApiClient::Auth::V2::Types::AuthGetTokenResponse.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
