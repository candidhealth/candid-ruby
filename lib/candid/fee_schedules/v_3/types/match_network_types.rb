# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for network types
        class MatchNetworkTypes < Internal::Types::Model
          field :value, lambda {
            Internal::Types::Array[Candid::Commons::Types::NetworkType]
          }, optional: false, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
