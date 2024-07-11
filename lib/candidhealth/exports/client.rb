# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_3/client"

module CandidApiClient
  module Exports
    class Client
      # @return [CandidApiClient::Exports::V3::V3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Exports::Client]
      def initialize(request_client:)
        @v_3 = CandidApiClient::Exports::V3::V3Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Exports::V3::AsyncV3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Exports::AsyncClient]
      def initialize(request_client:)
        @v_3 = CandidApiClient::Exports::V3::AsyncV3Client.new(request_client: request_client)
      end
    end
  end
end
