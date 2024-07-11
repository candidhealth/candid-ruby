# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module BillingNotes
    class Client
      # @return [CandidApiClient::BillingNotes::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::BillingNotes::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::BillingNotes::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::BillingNotes::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::BillingNotes::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::BillingNotes::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
