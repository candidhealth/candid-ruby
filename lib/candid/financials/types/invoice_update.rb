# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class InvoiceUpdate < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { String }, key: "SET"
        member -> { Object }, key: "REMOVE"
      end
    end
  end
end
