# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class SetOrClearPrincipalProcedureInformation < Internal::Types::Model
          field :value, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformation
          }, optional: true, nullable: false
        end
      end
    end
  end
end
