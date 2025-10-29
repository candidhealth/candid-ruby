# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class InsuranceType < Internal::Types::Model
          field :line_of_business, lambda {
            Candid::ExpectedNetworkStatus::V2::Types::LineOfBusiness
          }, optional: false, nullable: false
          field :insurance_type_codes, lambda {
            Candid::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes
          }, optional: false, nullable: false
        end
      end
    end
  end
end
