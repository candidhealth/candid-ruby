# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class BaseCredentialingSpan < Internal::Types::Model
          field :contracting_provider, -> { Candid::OrganizationProviders::V3::Types::OrganizationProviderV2 }, optional: false, nullable: false
          field :payer, -> { Candid::Payers::V3::Types::Payer }, optional: false, nullable: false
          field :start_date, -> { String }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :submitted_date, -> { String }, optional: true, nullable: false
          field :credentialing_status, -> { Candid::Credentialing::V2::Types::CredentialingSpanStatus }, optional: false, nullable: false
          field :payer_loaded_date, -> { String }, optional: true, nullable: false
          field :is_enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
