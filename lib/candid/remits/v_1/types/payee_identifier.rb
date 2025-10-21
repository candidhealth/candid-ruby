# frozen_string_literal: true

module Candid
  module Remits
    module V1
      module Types
        class PayeeIdentifier < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "NPI"
          member -> { String }, key: "TIN"
          member -> { String }, key: "CMS_PLAN_ID"
        end
      end
    end
  end
end
