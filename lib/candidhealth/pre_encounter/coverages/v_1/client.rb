# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "coverages/client"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        class Client
          # @return [CandidApiClient::PreEncounter::Coverages::V1::CoveragesClient]
          attr_reader :coverages

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Client]
          def initialize(request_client:)
            @coverages = CandidApiClient::PreEncounter::Coverages::V1::CoveragesClient.new(request_client: request_client)
          end
        end

        class AsyncClient
          # @return [CandidApiClient::PreEncounter::Coverages::V1::AsyncCoveragesClient]
          attr_reader :coverages

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::AsyncClient]
          def initialize(request_client:)
            @coverages = CandidApiClient::PreEncounter::Coverages::V1::AsyncCoveragesClient.new(request_client: request_client)
          end
        end
      end
    end
  end
end
