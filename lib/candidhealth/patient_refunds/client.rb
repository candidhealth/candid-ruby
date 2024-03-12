# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_1/client"

module CandidApiClient
  module PatientRefunds
    class Client
      attr_reader :v_1

      # @param request_client [RequestClient]
      # @return [PatientRefunds::Client]
      def initialize(request_client:)
        @v_1 = PatientRefunds::V1::V1Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_1

      # @param request_client [RequestClient]
      # @return [PatientRefunds::AsyncClient]
      def initialize(request_client:)
        @v_1 = PatientRefunds::V1::AsyncV1Client.new(request_client: request_client)
      end
    end
  end
end
