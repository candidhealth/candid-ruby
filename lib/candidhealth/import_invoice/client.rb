# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_1/client"

module CandidApiClient
  module ImportInvoice
    class Client
      attr_reader :v_1

      # @param request_client [RequestClient]
      # @return [ImportInvoice::Client]
      def initialize(request_client:)
        @v_1 = ImportInvoice::V1::V1Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_1

      # @param request_client [RequestClient]
      # @return [ImportInvoice::AsyncClient]
      def initialize(request_client:)
        @v_1 = ImportInvoice::V1::AsyncV1Client.new(request_client: request_client)
      end
    end
  end
end
