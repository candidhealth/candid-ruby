# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class DateUpdate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "SET"
          member -> { Object }, key: "REMOVE"
        end
      end
    end
  end
end
