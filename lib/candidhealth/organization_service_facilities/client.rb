# frozen_string_literal: true

require_relative "../../requests"
require_relative "v_2/client"

module CandidApiClient
  module OrganizationServiceFacilities
    class Client
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [OrganizationServiceFacilities::Client]
      def initialize(request_client:)
        @v_2 = OrganizationServiceFacilities::V2::V2Client.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :v_2

      # @param request_client [RequestClient]
      # @return [OrganizationServiceFacilities::AsyncClient]
      def initialize(request_client:)
        @v_2 = OrganizationServiceFacilities::V2::AsyncV2Client.new(request_client: request_client)
      end
    end
  end
end
