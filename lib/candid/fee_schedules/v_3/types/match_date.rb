# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for date of service
        class MatchDate < Internal::Types::Model
          field :value, -> { String }, optional: true, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
