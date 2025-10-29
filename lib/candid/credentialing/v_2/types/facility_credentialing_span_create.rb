# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class FacilityCredentialingSpanCreate < Internal::Types::Model
          field :service_facility_id, -> { String }, optional: false, nullable: false
          field :contracting_provider_id, -> { String }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :start_date, -> { String }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :submitted_date, -> { String }, optional: true, nullable: false
          field :payer_loaded_date, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
