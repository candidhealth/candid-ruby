# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      class Client
        # @return [Candid::PreEncounter::Images::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::V1::Client]
        def v_1
          @v_1 ||= Candid::PreEncounter::Images::V1::Client.new(client: @client)
        end
      end
    end
  end
end
