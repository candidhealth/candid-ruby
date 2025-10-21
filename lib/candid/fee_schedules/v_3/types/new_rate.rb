# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class NewRate < Internal::Types::Model
          field :dimensions, -> { Candid::FeeSchedules::V3::Types::Dimensions }, optional: false, nullable: false
          field :entries, -> { Internal::Types::Array[Candid::FeeSchedules::V3::Types::RateEntry] }, optional: false, nullable: false

        end
      end
    end
  end
end
