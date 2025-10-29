# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module MaritalStatus
            extend Candid::Internal::Types::Enum

            ANNULLED = "ANNULLED"
            DIVORCED = "DIVORCED"
            INTERLOCUTORY = "INTERLOCUTORY"
            SEPARATED = "SEPARATED"
            MARRIED = "MARRIED"
            COMMON_LAW = "COMMON_LAW"
            POLYGAMOUS = "POLYGAMOUS"
            DOMESTIC_PARTNER = "DOMESTIC_PARTNER"
            UNMARRIED = "UNMARRIED"
            NEVER_MARRIED = "NEVER_MARRIED"
            WIDOWED = "WIDOWED"
            UNKNOWN = "UNKNOWN"
          end
        end
      end
    end
  end
end
