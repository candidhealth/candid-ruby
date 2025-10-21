# frozen_string_literal: true

module Candid
  module Payers
    module V3
      module Types
        class PayerIdentifier < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Payers::V3::Types::PayerInfo }, key: "PAYER_INFO"
          member -> { String }, key: "PAYER_UUID"
        end
      end
    end
  end
end
