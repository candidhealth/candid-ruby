# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class FacilityCredentialingSpanUpdate < Internal::Types::Model
          field :facility_credentialing_id, -> { String }, optional: false, nullable: false
          field :contracting_provider_id, -> { String }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :start_date, -> { String }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :regions, -> { Candid::Commons::Types::Regions }, optional: true, nullable: false
          field :submitted_date, -> { String }, optional: true, nullable: false
          field :payer_loaded_date, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
