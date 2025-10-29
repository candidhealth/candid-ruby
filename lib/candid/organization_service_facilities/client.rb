# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    class Client
      # @return [Candid::OrganizationServiceFacilities::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V2::Client]
      def v_2
        @v_2 ||= Candid::OrganizationServiceFacilities::V2::Client.new(client: @client)
      end
    end
  end
end
