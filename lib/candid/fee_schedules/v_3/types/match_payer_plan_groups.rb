# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for a payer plan group
        class MatchPayerPlanGroups < Internal::Types::Model
          field :value, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
