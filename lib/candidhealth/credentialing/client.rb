# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module Credentialing
    class Client
      # @return [CandidApiClient::Credentialing::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Credentialing::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Credentialing::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Credentialing::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Credentialing::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Credentialing::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
