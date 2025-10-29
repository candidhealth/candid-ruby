# frozen_string_literal: true

module Candid
  module ServiceLines
    class Client
      # @return [Candid::ServiceLines::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V2::Client]
      def v_2
        @v_2 ||= Candid::ServiceLines::V2::Client.new(client: @client)
      end
    end
  end
end
