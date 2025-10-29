# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        module InvoiceSortField
          extend Candid::Internal::Types::Enum

          CREATED_AT = "CREATED_AT"
          UPDATED_AT = "UPDATED_AT"
          PATIENT_EXTERNAL_ID = "PATIENT_EXTERNAL_ID"
          NOTE = "NOTE"
          DUE_DATE = "DUE_DATE"
          STATUS = "STATUS"
        end
      end
    end
  end
end
