# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        module MeasurementUnitCode
          extend Candid::Internal::Types::Enum

          MILLILITERS = "ML"
          UNITS = "UN"
          GRAMS = "GR"
          INTERNATIONAL_UNIT = "F2"
          MILLIGRAM = "ME"
        end
      end
    end
  end
end
