# frozen_string_literal: true

module Candid
  module PatientPayments
    class Client
      # @return [Candid::PatientPayments::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::V4::Client]
      def v_4
        @v_4 ||= Candid::PatientPayments::V4::Client.new(client: @client)
      end
    end
  end
end
