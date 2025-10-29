# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      class Client
        # @return [Candid::PreEncounter::Lists::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::V1::Client]
        def v_1
          @v_1 ||= Candid::PreEncounter::Lists::V1::Client.new(client: @client)
        end
      end
    end
  end
end
