# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to DR code qualifier values.
        class DiagnosisRelatedGroup < Internal::Types::Model
          field :diagnosis_related_group_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::DiagnosisRelatedGroupCodeQualifier
          }, optional: false, nullable: false
          field :diagnosis_related_group_code, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
