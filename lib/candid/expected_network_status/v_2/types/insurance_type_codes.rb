# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class InsuranceTypeCodes < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Commons::Types::InsuranceTypeCode }, key: "INSURANCE_TYPE_CODE"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::EmptyObject }, key: "UNKNOWN_INSURANCE_TYPE_CODE"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::EmptyObject }, key: "NOT_APPLICABLE"
        end
      end
    end
  end
end
