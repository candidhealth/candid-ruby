# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class RegionStates < Internal::Types::Model
        field :states, -> { Internal::Types::Array[Candid::Commons::Types::State] }, optional: false, nullable: false
      end
    end
  end
end
