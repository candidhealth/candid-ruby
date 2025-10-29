# frozen_string_literal: true

module Candid
  module Payers
    class Client
      # @return [Candid::Payers::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V3::Client]
      def v_3
        @v_3 ||= Candid::Payers::V3::Client.new(client: @client)
      end

      # @return [Candid::V4::Client]
      def v_4
        @v_4 ||= Candid::Payers::V4::Client.new(client: @client)
      end
    end
  end
end
