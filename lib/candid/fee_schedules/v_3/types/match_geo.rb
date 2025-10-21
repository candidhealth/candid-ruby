# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for state or zip code
        class MatchGeo < Internal::Types::Model
          field :zip_code, -> { String }, optional: true, nullable: false
          field :state, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
