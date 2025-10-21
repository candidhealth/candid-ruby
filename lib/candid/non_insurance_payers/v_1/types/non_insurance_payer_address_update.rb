# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerAddressUpdate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Object }, key: "REMOVE"
          member -> { Candid::Commons::Types::StreetAddressShortZip }, key: "SET"
        end
      end
    end
  end
end
