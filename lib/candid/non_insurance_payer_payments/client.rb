# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    class Client
      # @return [Candid::NonInsurancePayerPayments::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::NonInsurancePayerPayments::V1::Client.new(client: @client)
      end
    end
  end
end
