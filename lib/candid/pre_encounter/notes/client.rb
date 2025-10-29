# frozen_string_literal: true

module Candid
  module PreEncounter
    module Notes
      class Client
        # @return [Candid::PreEncounter::Notes::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::V1::Client]
        def v_1
          @v_1 ||= Candid::PreEncounter::Notes::V1::Client.new(client: @client)
        end
      end
    end
  end
end
