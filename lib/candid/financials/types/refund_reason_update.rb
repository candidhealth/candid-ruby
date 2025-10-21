# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class RefundReasonUpdate < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Financials::Types::RefundReason }, key: "SET"
        member -> { Object }, key: "REMOVE"
      end
    end
  end
end
