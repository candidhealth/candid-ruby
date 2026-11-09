# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        class FacilityCredentialingSpanUpdate < Internal::Types::Model
          field :facility_credentialing_id, -> { String }, optional: false, nullable: false
          field :contracting_provider_id, -> { String }, optional: true, nullable: false
          field :credentialing_payer, -> { Candid::Credentialing::V3::Types::CredentialingCreatePayer }, optional: true, nullable: false
          field :start_date, -> { String }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :submitted_date, -> { String }, optional: true, nullable: false
          field :payer_loaded_date, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
