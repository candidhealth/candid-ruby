# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        class BaseCredentialingSpan < Internal::Types::Model
          field :contracting_provider, -> { Candid::OrganizationProviders::V3::Types::OrganizationProviderV2 }, optional: false, nullable: false
          field :credentialing_payer, -> { Candid::Credentialing::V3::Types::CredentialingPayer }, optional: false, nullable: false
          field :start_date, -> { String }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :submitted_date, -> { String }, optional: true, nullable: false
          field :credentialing_status, -> { Candid::Credentialing::V3::Types::CredentialingSpanStatus }, optional: false, nullable: false
          field :payer_loaded_date, -> { String }, optional: true, nullable: false
          field :is_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
