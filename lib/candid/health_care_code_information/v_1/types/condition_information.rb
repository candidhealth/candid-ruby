# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BG code qualifier value.
        class ConditionInformation < Internal::Types::Model
          field :condition_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::ConditionInformationCodeQualifier
          }, optional: false, nullable: false
          field :condition_code, lambda {
            Candid::HealthCareCodeInformation::V1::Types::ConditionCode
          }, optional: false, nullable: false
        end
      end
    end
  end
end
