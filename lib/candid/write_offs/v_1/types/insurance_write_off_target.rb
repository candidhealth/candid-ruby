# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class InsuranceWriteOffTarget < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "SERVICE_LINE_ID"
          member -> { String }, key: "CLAIM_ID"
          member -> { String }, key: "BILLING_PROVIDER_ID"
        end
      end
    end
  end
end
