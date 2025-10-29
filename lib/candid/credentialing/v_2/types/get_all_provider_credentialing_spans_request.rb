# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class GetAllProviderCredentialingSpansRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :provider_id, -> { String }, optional: true, nullable: false
          field :as_rendering_provider, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :as_contracting_provider, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
