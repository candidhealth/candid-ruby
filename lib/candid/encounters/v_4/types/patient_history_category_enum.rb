# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        module PatientHistoryCategoryEnum
          extend Candid::Internal::Types::Enum

          PRESENT_ILLNESS = "present_illness"
          MEDICAL = "medical"
          FAMILY = "family"
          SOCIAL = "social"
        end
      end
    end
  end
end
