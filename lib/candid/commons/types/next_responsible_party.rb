# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module NextResponsibleParty
        extend Candid::Internal::Types::Enum

        PRIMARY = "primary"
        SECONDARY = "secondary"
        TERTIARY = "tertiary"
        PATIENT = "patient"
        NON_INSURANCE = "non_insurance"
        NONE = "none"
      end
    end
  end
end
