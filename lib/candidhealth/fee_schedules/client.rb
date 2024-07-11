# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_3/client"

module CandidApiClient
  module FeeSchedules
    class Client
      # @return [CandidApiClient::FeeSchedules::V3::V3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::FeeSchedules::Client]
      def initialize(request_client:)
        @v_3 = CandidApiClient::FeeSchedules::V3::V3Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::FeeSchedules::V3::AsyncV3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::FeeSchedules::AsyncClient]
      def initialize(request_client:)
        @v_3 = CandidApiClient::FeeSchedules::V3::AsyncV3Client.new(request_client: request_client)
      end
    end
  end
end
