# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module Eligibility
    class Client
      # @return [CandidApiClient::Eligibility::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::Eligibility::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Eligibility::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::Eligibility::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::Eligibility::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::Eligibility::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
