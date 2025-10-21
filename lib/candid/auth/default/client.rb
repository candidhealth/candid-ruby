
module Candid
  module Auth
    module Default
      class Client
        # @return [Candid::Auth::Default::Client]
        def initialize(client:)
          @client = client
        end

        # <Callout intent="info">
        # Candid Health SDKs automatically handle authentication workflows after configuring them with the `client_id` and
        # `client_secret`.
        # </Callout>
        # 
        # Candid Health utilizes the [OAuth 2.0 bearer token authentication scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our auth flow. You obtain the bearer token for all
        # subsequent API requests via the `/auth/v2/token` endpoint defined below, which requires you to provide your `client_id` and `client_secret`. Your `client_id` and `client_secret` can be [generated](https://support.joincandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys) from the "Users & Credentials" tab by your org admin.
        # 
        # The `/auth/v2/token` endpoint accepts both `Content-Type: application/json` and `Content-Type: application/x-www-form-urlencoded`. The request body should contain the `client_id` and `client_secret` as follows:
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
        # The bearer token is a signed [JWT](https://jwt.io/). The public key for the JWT can be found [here](https://candidhealth.auth0.com/pem) for any verification workflows.
        # 
        # The bearer token should be provided in the `Authorization` header for all subsequent API calls.
        # 
        # <Callout intent="warning">
        # The bearer token expires 5 hours after it has been created. After it has expired, the client will receive an "HTTP 401
        # Unauthorized" error, at which point the client should generate a new token. It is important that tokens be reused between
        # requests; if the client attempts to generate a token too often, it will be rate-limited and will receive an `HTTP 429 Too Many Requests` error.
        # </Callout>
        #
        # @return [Candid::Auth::Default::Types::AuthGetTokenResponse]
        def get_token(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Auth::Default::Types::AuthGetTokenResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
