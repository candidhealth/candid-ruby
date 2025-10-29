# frozen_string_literal: true

module Candid
  module Tasks
    class Client
      # @return [Candid::Tasks::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V3::Client]
      def v_3
        @v_3 ||= Candid::Tasks::V3::Client.new(client: @client)
      end
    end
  end
end
