# frozen_string_literal: true

module Candid
  module Views
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

      # @return [Candid::Dynamic::Client]
      def dynamic
        @dynamic ||= Candid::Views::Dynamic::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
