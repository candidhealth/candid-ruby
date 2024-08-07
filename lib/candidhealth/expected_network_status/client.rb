# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_1/client"
require_relative "v_2/client"

module CandidApiClient
  module ExpectedNetworkStatus
    class Client
      # @return [CandidApiClient::ExpectedNetworkStatus::V1::V1Client]
      attr_reader :v_1
      # @return [CandidApiClient::ExpectedNetworkStatus::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::ExpectedNetworkStatus::Client]
      def initialize(request_client:)
        @v_1 = CandidApiClient::ExpectedNetworkStatus::V1::V1Client.new(request_client: request_client)
        @v_2 = CandidApiClient::ExpectedNetworkStatus::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::ExpectedNetworkStatus::V1::AsyncV1Client]
      attr_reader :v_1
      # @return [CandidApiClient::ExpectedNetworkStatus::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::ExpectedNetworkStatus::AsyncClient]
      def initialize(request_client:)
        @v_1 = CandidApiClient::ExpectedNetworkStatus::V1::AsyncV1Client.new(request_client: request_client)
        @v_2 = CandidApiClient::ExpectedNetworkStatus::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
