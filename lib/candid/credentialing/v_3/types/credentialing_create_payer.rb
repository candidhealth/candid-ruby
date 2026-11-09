# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        # Identifies the payer for a credentialing span. Provide either a payer_uuid (an EDI payer) or a payer_group_id.
        class CredentialingCreatePayer < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "PAYER_UUID"
          member -> { String }, key: "PAYER_GROUP_ID"
        end
      end
    end
  end
end
