# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module CoverageUpdateSource
            extend Candid::Internal::Types::Enum

            ELIGIBILITY_CHECK = "eligibility_check"
            MANUAL = "manual"
            UNKNOWN = "unknown"
          end
        end
      end
    end
  end
end
