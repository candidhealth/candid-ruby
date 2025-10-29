# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class RatesPage < Internal::Types::Model
          field :rates, lambda {
            Internal::Types::Array[Candid::FeeSchedules::V3::Types::Rate]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
