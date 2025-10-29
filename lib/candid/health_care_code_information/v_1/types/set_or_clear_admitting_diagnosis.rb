# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class SetOrClearAdmittingDiagnosis < Internal::Types::Model
          field :value, lambda {
            Candid::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis
          }, optional: true, nullable: false
        end
      end
    end
  end
end
