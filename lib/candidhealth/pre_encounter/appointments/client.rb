# frozen_string_literal: true

require_relative "../../../requests"
require_relative "v_1/client"

module CandidApiClient
  module PreEncounter
    module Appointments
      class Client
        # @return [CandidApiClient::PreEncounter::Appointments::V1::V1Client]
        attr_reader :v_1

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PreEncounter::Appointments::Client]
        def initialize(request_client:)
          @v_1 = CandidApiClient::PreEncounter::Appointments::V1::V1Client.new(request_client: request_client)
        end
      end

      class AsyncClient
        # @return [CandidApiClient::PreEncounter::Appointments::V1::AsyncV1Client]
        attr_reader :v_1

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PreEncounter::Appointments::AsyncClient]
        def initialize(request_client:)
          @v_1 = CandidApiClient::PreEncounter::Appointments::V1::AsyncV1Client.new(request_client: request_client)
        end
      end
    end
  end
end
