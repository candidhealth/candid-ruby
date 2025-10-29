# frozen_string_literal: true

module Candid
  module PreEncounter
    module Tags
      class Client
        # @return [Candid::PreEncounter::Tags::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::V1::Client]
        def v_1
          @v_1 ||= Candid::PreEncounter::Tags::V1::Client.new(client: @client)
        end
      end
    end
  end
end
