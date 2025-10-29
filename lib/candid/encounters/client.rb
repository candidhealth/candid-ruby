# frozen_string_literal: true

module Candid
  module Encounters
    class Client
      # @return [Candid::Encounters::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V4::Client]
      def v_4
        @v_4 ||= Candid::Encounters::V4::Client.new(client: @client)
      end
    end
  end
end
