# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_3/client"

module CandidApiClient
  module OrganizationProviders
    class Client
      # @return [CandidApiClient::OrganizationProviders::V3::V3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::RequestClient]
      # @return [CandidApiClient::OrganizationProviders::Client]
      def initialize(request_client:)
        @v_3 = CandidApiClient::OrganizationProviders::V3::V3Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [CandidApiClient::OrganizationProviders::V3::AsyncV3Client]
      attr_reader :v_3

      # @param request_client [CandidApiClient::AsyncRequestClient]
      # @return [CandidApiClient::OrganizationProviders::AsyncClient]
      def initialize(request_client:)
        @v_3 = CandidApiClient::OrganizationProviders::V3::AsyncV3Client.new(request_client: request_client)
      end
    end
  end
end
