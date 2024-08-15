# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module ServiceLines
    class Client
      # @return [CandidApiClient::ServiceLines::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::ServiceLines::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::ServiceLines::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::ServiceLines::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::ServiceLines::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::ServiceLines::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
