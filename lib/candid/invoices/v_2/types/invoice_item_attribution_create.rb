# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        # Points to the claim or service line that this invoice is attributed to
        class InvoiceItemAttributionCreate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "SERVICE_LINE_ID"
          member -> { String }, key: "CLAIM_ID"
          member -> { Object }, key: "UNATTRIBUTED"
        end
      end
    end
  end
end
