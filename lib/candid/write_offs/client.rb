# frozen_string_literal: true

module Candid
  module WriteOffs
    class Client
      # @return [Candid::WriteOffs::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::WriteOffs::V1::Client.new(client: @client)
      end
    end
  end
end
