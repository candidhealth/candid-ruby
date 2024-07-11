# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_4/client"

module CandidApiClient
  module PatientPayments
    class Client
      # @return [CandidApiClient::PatientPayments::V4::V4Client]
      attr_reader :v_4

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::PatientPayments::Client]
      def initialize(request_client:)
        @v_4 = CandidApiClient::PatientPayments::V4::V4Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::PatientPayments::V4::AsyncV4Client]
      attr_reader :v_4

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::PatientPayments::AsyncClient]
      def initialize(request_client:)
        @v_4 = CandidApiClient::PatientPayments::V4::AsyncV4Client.new(request_client: request_client)
      end
    end
  end
end
