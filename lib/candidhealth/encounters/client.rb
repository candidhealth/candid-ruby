# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_4/client"

module CandidApiClient
  module Encounters
    class Client
      attr_reader :v_4

      # @param request_client [RequestClient]
      # @return [Encounters::Client]
      def initialize(request_client:)
        @v_4 = Encounters::V4::V4Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_4

      # @param request_client [RequestClient]
      # @return [Encounters::AsyncClient]
      def initialize(request_client:)
        @v_4 = Encounters::V4::AsyncV4Client.new(request_client: request_client)
      end
    end
  end
end
