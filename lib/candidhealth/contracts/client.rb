# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module Contracts
    class Client
      # @return [CandidApiClient::Contracts::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Contracts::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Contracts::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Contracts::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Contracts::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Contracts::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
