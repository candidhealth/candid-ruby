# frozen_string_literal: true

module Candid
  module BillingNotes
    class Client
      # @return [Candid::BillingNotes::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V2::Client]
      def v_2
        @v_2 ||= Candid::BillingNotes::V2::Client.new(client: @client)
      end
    end
  end
end
