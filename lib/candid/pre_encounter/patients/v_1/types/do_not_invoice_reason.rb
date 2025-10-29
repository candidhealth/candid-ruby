# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module DoNotInvoiceReason
            extend Candid::Internal::Types::Enum

            BANKRUPTCY = "BANKRUPTCY"
            DECEASED = "DECEASED"
            HARDSHIP = "HARDSHIP"
            OTHER = "OTHER"
            COLLECTIONS = "COLLECTIONS"
            BAD_ADDRESS = "BAD_ADDRESS"
            PROFESSIONAL_COURTESY = "PROFESSIONAL_COURTESY"
          end
        end
      end
    end
  end
end
