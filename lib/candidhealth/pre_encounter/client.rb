# frozen_string_literal: true

require_relative "../../requests"
require_relative "coverages/client"
require_relative "patients/client"

module CandidApiClient
  module PreEncounter
    class Client
      # @return [CandidApiClient::PreEncounter::CoveragesClient]
      attr_reader :coverages
      # @return [CandidApiClient::PreEncounter::PatientsClient]
      attr_reader :patients

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::PreEncounter::Client]
      def initialize(request_client:)
        @coverages = CandidApiClient::PreEncounter::CoveragesClient.new(request_client: request_client)
        @patients = CandidApiClient::PreEncounter::PatientsClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::PreEncounter::AsyncCoveragesClient]
      attr_reader :coverages
      # @return [CandidApiClient::PreEncounter::AsyncPatientsClient]
      attr_reader :patients

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::PreEncounter::AsyncClient]
      def initialize(request_client:)
        @coverages = CandidApiClient::PreEncounter::AsyncCoveragesClient.new(request_client: request_client)
        @patients = CandidApiClient::PreEncounter::AsyncPatientsClient.new(request_client: request_client)
      end
    end
  end
end
