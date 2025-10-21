# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class DateRangeOptionalEnd < Internal::Types::Model
        field :start_date, -> { String }, optional: false, nullable: false
        field :end_date, -> { String }, optional: true, nullable: false

      end
    end
  end
end
