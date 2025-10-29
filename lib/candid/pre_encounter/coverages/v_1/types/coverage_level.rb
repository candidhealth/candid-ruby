# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          module CoverageLevel
            extend Candid::Internal::Types::Enum

            EMPLOYEE_AND_CHILDREN = "EMPLOYEE_AND_CHILDREN"
            EMPLOYEE_ONLY = "EMPLOYEE_ONLY"
            EMPLOYEE_AND_SPOUSE = "EMPLOYEE_AND_SPOUSE"
            FAMILY = "FAMILY"
            INDIVIDUAL = "INDIVIDUAL"
          end
        end
      end
    end
  end
end
