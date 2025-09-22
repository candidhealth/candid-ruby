# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_3/client"
require_relative "v_4/client"

module CandidApiClient
  module Payers
    class Client
      # @return [CandidApiClient::Payers::V3::V3Client]
      attr_reader :v_3
      # @return [CandidApiClient::Payers::V4::V4Client]
      attr_reader :v_4

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Payers::Client]
      def initialize(request_client:)
        @v_3 = CandidApiClient::Payers::V3::V3Client.new(request_client: request_client)
        @v_4 = CandidApiClient::Payers::V4::V4Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Payers::V3::AsyncV3Client]
      attr_reader :v_3
      # @return [CandidApiClient::Payers::V4::AsyncV4Client]
      attr_reader :v_4

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Payers::AsyncClient]
      def initialize(request_client:)
        @v_3 = CandidApiClient::Payers::V3::AsyncV3Client.new(request_client: request_client)
        @v_4 = CandidApiClient::Payers::V4::AsyncV4Client.new(request_client: request_client)
      end
    end
  end
end
