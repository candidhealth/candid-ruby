# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class InsuranceTypes < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Object }, key: "ALL_APPLY"
          member -> { Object }, key: "NONE_APPLY"
          member -> { Internal::Types::Array[Candid::Commons::Types::InsuranceTypeCode] }, key: "THESE_APPLY"
        end
      end
    end
  end
end
