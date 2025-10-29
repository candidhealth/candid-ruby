# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class DimensionsPage < Internal::Types::Model
          field :dimensions, lambda {
            Internal::Types::Array[Candid::FeeSchedules::V3::Types::OptionalDimensions]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
