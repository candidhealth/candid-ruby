# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_4/client"

module CandidApiClient
  module PatientPayments
    class Client
      attr_reader :v_4

      # @param request_client [RequestClient]
      # @return [PatientPayments::Client]
      def initialize(request_client:)
        @v_4 = PatientPayments::V4::V4Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_4

      # @param request_client [RequestClient]
      # @return [PatientPayments::AsyncClient]
      def initialize(request_client:)
        @v_4 = PatientPayments::V4::AsyncV4Client.new(request_client: request_client)
      end
    end
  end
end
