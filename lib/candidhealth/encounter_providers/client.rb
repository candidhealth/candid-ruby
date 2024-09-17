# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module EncounterProviders
    class Client
      # @return [CandidApiClient::EncounterProviders::V2::V2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::EncounterProviders::Client]
      def initialize(request_client:)
        @v_2 = CandidApiClient::EncounterProviders::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::EncounterProviders::V2::AsyncV2Client]
      attr_reader :v_2

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::EncounterProviders::AsyncClient]
      def initialize(request_client:)
        @v_2 = CandidApiClient::EncounterProviders::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
