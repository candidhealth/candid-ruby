# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        module PatientArStatus
          extend Candid::Internal::Types::Enum
          INVOICEABLE = "invoiceable"
          NON_INVOICEABLE = "non_invoiceable"end
      end
    end
  end
end
