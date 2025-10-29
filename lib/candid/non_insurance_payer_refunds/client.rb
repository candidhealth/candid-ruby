# frozen_string_literal: true

module Candid
  module NonInsurancePayerRefunds
    class Client
      # @return [Candid::NonInsurancePayerRefunds::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V1::Client]
      def v_1
        @v_1 ||= Candid::NonInsurancePayerRefunds::V1::Client.new(client: @client)
      end
    end
  end
end
