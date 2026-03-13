# frozen_string_literal: true

module Candid
  module Auth
    module Default
      class Client
        # @param client [Candid::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # <Callout intent="info">
        # Candid Health SDKs automatically handle authentication workflows after configuring them with the `client_id`
        # and
        # `client_secret`.
        # </Callout>
        #
        # Candid Health utilizes the [OAuth 2.0 bearer token authentication
        # scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our auth flow. You obtain the
        # bearer token for all
        # subsequent API requests via the `/auth/v2/token` endpoint defined below, which requires you to provide your
        # `client_id` and `client_secret`. Your `client_id` and `client_secret` can be
        # [generated](https://support.joincandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys)
        # from the "Users & Credentials" tab by your org admin.
        #
        # The `/auth/v2/token` endpoint accepts both `Content-Type: application/json` and `Content-Type:
        # application/x-www-form-urlencoded`. The request body should contain the `client_id` and `client_secret` as
        # follows:
        #
        # ```json
        # {
        #   "client_id": "YOUR_CLIENT_ID",
        #   "client_secret": "YOUR_CLIENT_SECRET"
        # }
        # ```
        # or as URL-encoded form data:
        #
        # ```
        # client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET
        # ```
        #
        # The bearer token is a signed [JWT](https://jwt.io/). The public key for the JWT can be found
        # [here](https://candidhealth.auth0.com/pem) for any verification workflows.
        #
        # The bearer token should be provided in the `Authorization` header for all subsequent API calls.
        #
        # <Callout intent="warning">
        # The bearer token expires 5 hours after it has been created. After it has expired, the client will receive an
        # "HTTP 401
        # Unauthorized" error, at which point the client should generate a new token. It is important that tokens be
        # reused between
        # requests; if the client attempts to generate a token too often, it will be rate-limited and will receive an
        # `HTTP 429 Too Many Requests` error.
        # </Callout>
        #
        # @param request_options [Hash]
        # @param params [Candid::Auth::Default::Types::AuthGetTokenRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Auth::Default::Types::AuthGetTokenResponse]
        def get_token(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/auth/v2/token",
            body: Candid::Auth::Default::Types::AuthGetTokenRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Auth::Default::Types::AuthGetTokenResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
