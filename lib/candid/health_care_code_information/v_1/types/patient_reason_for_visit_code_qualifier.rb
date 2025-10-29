# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        module PatientReasonForVisitCodeQualifier
          extend Candid::Internal::Types::Enum

          CPR = "PR"
          CAPR = "APR"
        end
      end
    end
  end
end
