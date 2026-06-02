# frozen_string_literal: true

module Candid
  module Financials
    module Types
      module PatientPaymentCreateSource
        extend Candid::Internal::Types::Enum

        MANUAL_ENTRY = "MANUAL_ENTRY"
        PHREESIA = "PHREESIA"
        SHERPA_HEALTH = "SHERPA_HEALTH"
      end
    end
  end
end
