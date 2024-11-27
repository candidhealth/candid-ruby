# frozen_string_literal: true

require_relative "../../requests"
require_relative "tags/client"

module CandidApiClient
  module PreEncounter
    class Client
      # @return [CandidApiClient::PreEncounter::Tags::Client]
      attr_reader :pre_encounter

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::PreEncounter::Client]
      def initialize(request_client:)
        @pre_encounter = CandidApiClient::PreEncounter::Tags::Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::PreEncounter::Tags::AsyncClient]
      attr_reader :pre_encounter

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::PreEncounter::AsyncClient]
      def initialize(request_client:)
        @pre_encounter = CandidApiClient::PreEncounter::Tags::AsyncClient.new(request_client: request_client)
      end
    end
  end
end
