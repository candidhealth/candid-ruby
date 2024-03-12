# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module Auth
    class Client
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [Auth::Client]
      def initialize(request_client:)
        @v_2 = Auth::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [Auth::AsyncClient]
      def initialize(request_client:)
        @v_2 = Auth::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
