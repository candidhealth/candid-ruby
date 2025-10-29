# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for a CPT code
        class MatchCptCode < Internal::Types::Model
          field :value, -> { String }, optional: false, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
