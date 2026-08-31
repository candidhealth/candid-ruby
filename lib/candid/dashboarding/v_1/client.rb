# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
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

        # Retrieves values for one or more metrics. Each metric is computed independently, so a
        # metric that cannot be resolved returns an `error` on its own result rather than failing
        # the request.
        #
        # Each query reads current state by default. Count metrics also accept a `yesterday`
        # snapshot, so day-over-day change is computed by querying both and taking the difference.
        #
        # See the [Metrics Reference](/docs/dashboarding-metrics) for the full catalog, including
        # value types and staleness SLAs.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::Dashboarding::V1::Types::MetricsQueryResponse]
        def query_metrics(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/dashboarding/v1/metrics",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::Dashboarding::V1::Types::MetricsQueryResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
