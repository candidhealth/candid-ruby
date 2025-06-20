# frozen_string_literal: true

require_relative "../../requests"
require_relative "default/client"

module CandidApiClient
  module Auth
    class Client
      # @return [CandidApiClient::Auth::Default::DefaultClient]
      attr_reader :default

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Auth::Client]
      def initialize(request_client:)
        @default = CandidApiClient::Auth::Default::DefaultClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Auth::Default::AsyncDefaultClient]
      attr_reader :default

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Auth::AsyncClient]
      def initialize(request_client:)
        @default = CandidApiClient::Auth::Default::AsyncDefaultClient.new(request_client: request_client)
      end
    end
  end
end
