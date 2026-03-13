# frozen_string_literal: true

module Candid
  module Contracts
    class Client
      # @param client [Candid::Internal::Http::RawClient]
      # @param base_url [String, nil]
      # @param environment [Hash[Symbol, String], nil]
      #
      # @return [void]
      def initialize(client:, base_url: nil, environment: nil)
        @client = client
        @base_url = base_url
        @environment = environment
      end

      # @return [Candid::V2::Client]
      def v_2
        @v_2 ||= Candid::Contracts::V2::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::V3::Client]
      def v_3
        @v_3 ||= Candid::Contracts::V3::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
