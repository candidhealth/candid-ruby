# frozen_string_literal: true

module Candid
  module PatientPayments
    class Client
      # @param client [Candid::Internal::Http::RawClient]
      # @param base_url [String, nil]
      # @param environment [Hash[Symbol, String], nil]
      #
      # @return [void]
      def initialize(client:, base_url: nil, environment: nil)
        @client = client
        @base_url = base_url
        @environment = environment
      end

      # @return [Candid::V4::Client]
      def v_4
        @v_4 ||= Candid::PatientPayments::V4::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
