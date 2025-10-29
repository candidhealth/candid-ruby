# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class IdpUserMetadata < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Users::V2::Types::AuthZeroMetadata }, key: "AUTH_ZERO_METADATA"
          member -> { Candid::Users::V2::Types::GoogleAppsMetadata }, key: "GOOGLE_APPS_METADATA"
          member -> { Candid::Users::V2::Types::OtherIdpMetadata }, key: "OTHER_IDP_METADATA"
        end
      end
    end
  end
end
