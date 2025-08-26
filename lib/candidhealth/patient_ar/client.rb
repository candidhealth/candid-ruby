# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_1/client"

module CandidApiClient
  module PatientAr
    class Client
      # @return [CandidApiClient::PatientAr::V1::V1Client]
      attr_reader :v_1

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::PatientAr::Client]
      def initialize(request_client:)
        @v_1 = CandidApiClient::PatientAr::V1::V1Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::PatientAr::V1::AsyncV1Client]
      attr_reader :v_1

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::PatientAr::AsyncClient]
      def initialize(request_client:)
        @v_1 = CandidApiClient::PatientAr::V1::AsyncV1Client.new(request_client: request_client)
      end
    end
  end
end
