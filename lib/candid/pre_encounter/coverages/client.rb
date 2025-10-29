# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      class Client
        # @return [Candid::PreEncounter::Coverages::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::V1::Client]
        def v_1
          @v_1 ||= Candid::PreEncounter::Coverages::V1::Client.new(client: @client)
        end
      end
    end
  end
end
