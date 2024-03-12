# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_3/client"

module CandidApiClient
  module OrganizationProviders
    class Client
      attr_reader :v_3

      # @param request_client [RequestClient]
      # @return [OrganizationProviders::Client]
      def initialize(request_client:)
        @v_3 = OrganizationProviders::V3::V3Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_3

      # @param request_client [RequestClient]
      # @return [OrganizationProviders::AsyncClient]
      def initialize(request_client:)
        @v_3 = OrganizationProviders::V3::AsyncV3Client.new(request_client: request_client)
      end
    end
  end
end
