# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class Regions < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Commons::Types::RegionStates }, key: "STATES"
        member -> { Candid::Commons::Types::RegionNational }, key: "NATIONAL"
      end
    end
  end
end
