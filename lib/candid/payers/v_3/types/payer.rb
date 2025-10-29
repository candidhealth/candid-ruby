# frozen_string_literal: true

module Candid
  module Payers
    module V3
      module Types
        class Payer < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :payer_id, -> { String }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: false, nullable: false
          field :availity_payer_name, -> { String }, optional: true, nullable: false
          field :availity_claims_payer_id, -> { String }, optional: true, nullable: false
          field :availity_eligibility_id, -> { String }, optional: true, nullable: false
          field :availity_remittance_payer_id, -> { String }, optional: true, nullable: false
          field :street_address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
        end
      end
    end
  end
end
