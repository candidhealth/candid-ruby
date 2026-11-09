# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        # The payer associated with the credentialing span. Either an EDI payer or a payer group.
        class CredentialingPayer < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Payers::V4::Types::Payer }, key: "PAYER"
          member -> { Candid::PayerGroups::V1::Types::PayerGroup }, key: "PAYER_GROUP"
        end
      end
    end
  end
end
