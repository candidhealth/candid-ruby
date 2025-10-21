# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class RateUpload < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::FeeSchedules::V3::Types::NewRate }, key: "NEW_RATE"
          member -> { Candid::FeeSchedules::V3::Types::NewRateVersion }, key: "NEW_VERSION"
        end
      end
    end
  end
end
