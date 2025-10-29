# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    class Client
      # @return [Candid::ExpectedNetworkStatus::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::ExpectedNetworkStatus::V1::Client.new(client: @client)
      end

      # @return [Candid::V2::Client]
      def v_2
        @v_2 ||= Candid::ExpectedNetworkStatus::V2::Client.new(client: @client)
      end
    end
  end
end
