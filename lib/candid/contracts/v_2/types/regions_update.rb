# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class RegionsUpdate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Commons::Types::Regions }, key: "SET"
          member -> { Object }, key: "REMOVE"
        end
      end
    end
  end
end
