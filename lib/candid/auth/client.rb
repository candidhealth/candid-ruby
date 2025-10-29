# frozen_string_literal: true

module Candid
  module Auth
    class Client
      # @return [Candid::Auth::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::Default::Client]
      def default
        @default ||= Candid::Auth::Default::Client.new(client: @client)
      end
    end
  end
end
