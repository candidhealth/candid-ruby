# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module ReferralUnit
            extend Candid::Internal::Types::Enum

            VISIT = "VISIT"
            UNIT = "UNIT"
          end
        end
      end
    end
  end
end
