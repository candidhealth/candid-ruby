# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_1/client"
require_relative "v_2/client"

module CandidApiClient
  module ExpectedNetworkStatus
    class Client
      attr_reader :v_1, :v_2

      # @param request_client [RequestClient]
      # @return [ExpectedNetworkStatus::Client]
      def initialize(request_client:)
        @v_1 = ExpectedNetworkStatus::V1::V1Client.new(request_client: request_client)
        @v_2 = ExpectedNetworkStatus::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_1, :v_2

      # @param request_client [RequestClient]
      # @return [ExpectedNetworkStatus::AsyncClient]
      def initialize(request_client:)
        @v_1 = ExpectedNetworkStatus::V1::AsyncV1Client.new(request_client: request_client)
        @v_2 = ExpectedNetworkStatus::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
