# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class RemovableDateRangeOptionalEnd < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Commons::Types::DateRangeOptionalEnd }, key: "DATE_RANGE"
        member -> { Object }, key: "REMOVE"
      end
    end
  end
end
