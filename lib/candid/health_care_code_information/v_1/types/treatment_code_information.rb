# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the TC code qualifier value.
        class TreatmentCodeInformation < Internal::Types::Model
          field :treatment_code_qualifier, -> { Candid::HealthCareCodeInformation::V1::Types::TreatmentCodeQualifier }, optional: false, nullable: false
          field :treatment_code, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
