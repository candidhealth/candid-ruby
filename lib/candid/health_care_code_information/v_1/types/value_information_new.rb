# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BE code qualifier value.
        class ValueInformationNew < Internal::Types::Model
          field :value_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::ValueCodeQualifier
          }, optional: false, nullable: false
          field :value_code, lambda {
            Candid::HealthCareCodeInformation::V1::Types::ValueCode
          }, optional: false, nullable: false
          field :value_code_amount, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
