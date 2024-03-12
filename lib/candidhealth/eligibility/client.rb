# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module Eligibility
    class Client
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [Eligibility::Client]
      def initialize(request_client:)
        @v_2 = Eligibility::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [Eligibility::AsyncClient]
      def initialize(request_client:)
        @v_2 = Eligibility::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
