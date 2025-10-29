# frozen_string_literal: true

module Candid
  module OrganizationProviders
    class Client
      # @return [Candid::OrganizationProviders::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V3::Client]
      def v_3
        @v_3 ||= Candid::OrganizationProviders::V3::Client.new(client: @client)
      end
    end
  end
end
