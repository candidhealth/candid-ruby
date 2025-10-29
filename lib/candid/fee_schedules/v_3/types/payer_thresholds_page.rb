# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class PayerThresholdsPage < Internal::Types::Model
          field :payer_thresholds, lambda {
            Internal::Types::Hash[String, Candid::FeeSchedules::V3::Types::PayerThreshold]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
