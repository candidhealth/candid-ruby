# frozen_string_literal: true

module Candid
  module Superbills
    class Client
      # @return [Candid::Superbills::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::Superbills::V1::Client.new(client: @client)
      end
    end
  end
end
