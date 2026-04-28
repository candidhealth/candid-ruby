# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module AdvancedDirective
            extend Candid::Internal::Types::Enum

            NONE = "NONE"
            DURABLE_POWER_OF_ATTORNEY = "DURABLE_POWER_OF_ATTORNEY"
            LIVING_WILL = "LIVING_WILL"
            DO_NOT_RESUSCITATE = "DO_NOT_RESUSCITATE"
            STANDARD_PRECAUTIONS = "STANDARD_PRECAUTIONS"
            FALL_RISK = "FALL_RISK"
          end
        end
      end
    end
  end
end
