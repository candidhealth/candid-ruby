# frozen_string_literal: true

module Candid
  module InsurancePayments
    class Client
      # @return [Candid::InsurancePayments::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::InsurancePayments::V1::Client.new(client: @client)
      end
    end
  end
end
