# frozen_string_literal: true

module Candid
  module PreEncounter
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

      # @return [Candid::Appointments::Client]
      def appointments
        @appointments ||= Candid::PreEncounter::Appointments::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Coverages::Client]
      def coverages
        @coverages ||= Candid::PreEncounter::Coverages::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::EligibilityChecks::Client]
      def eligibility_checks
        @eligibility_checks ||= Candid::PreEncounter::EligibilityChecks::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Images::Client]
      def images
        @images ||= Candid::PreEncounter::Images::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Lists::Client]
      def lists
        @lists ||= Candid::PreEncounter::Lists::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Notes::Client]
      def notes
        @notes ||= Candid::PreEncounter::Notes::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Patients::Client]
      def patients
        @patients ||= Candid::PreEncounter::Patients::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Candid::Tags::Client]
      def tags
        @tags ||= Candid::PreEncounter::Tags::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
