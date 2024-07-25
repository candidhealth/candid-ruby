# frozen_string_literal: true

require_relative "../../../requests"
require_relative "v_1/client"

module CandidApiClient
  module PreEncounter
    module Patients
      class Client
        # @return [CandidApiClient::PreEncounter::Patients::V1::Client]
        attr_reader :pre_encounter

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PreEncounter::Patients::Client]
        def initialize(request_client:)
          @pre_encounter = CandidApiClient::PreEncounter::Patients::V1::Client.new(request_client: request_client)
        end
      end

      class AsyncClient
        # @return [CandidApiClient::PreEncounter::Patients::V1::AsyncClient]
        attr_reader :pre_encounter

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PreEncounter::Patients::AsyncClient]
        def initialize(request_client:)
          @pre_encounter = CandidApiClient::PreEncounter::Patients::V1::AsyncClient.new(request_client: request_client)
        end
      end
    end
  end
end
