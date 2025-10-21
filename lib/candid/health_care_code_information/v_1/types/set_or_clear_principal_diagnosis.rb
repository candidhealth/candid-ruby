# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class SetOrClearPrincipalDiagnosis < Internal::Types::Model
          field :value, -> { Candid::HealthCareCodeInformation::V1::Types::PrincipalDiagnosis }, optional: true, nullable: false

        end
      end
    end
  end
end
