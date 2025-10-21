# frozen_string_literal: true

module Candid
  module InsuranceCards
    module V2
      module Types
        class InsuranceCardCreateOptional < Internal::Types::Model
          field :member_id, -> { String }, optional: true, nullable: false
          field :payer_name, -> { String }, optional: true, nullable: false
          field :payer_id, -> { String }, optional: true, nullable: false
          field :rx_bin, -> { String }, optional: true, nullable: false
          field :rx_pcn, -> { String }, optional: true, nullable: false
          field :image_url_front, -> { String }, optional: true, nullable: false
          field :image_url_back, -> { String }, optional: true, nullable: false
          field :emr_payer_crosswalk, -> { Candid::Commons::Types::EmrPayerCrosswalk }, optional: true, nullable: false

        end
      end
    end
  end
end
