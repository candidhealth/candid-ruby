# frozen_string_literal: true

module Candid
  module InsuranceCards
    module V2
      module Types
        class InsuranceCard < Internal::Types::Model
          field :insurance_card_id, -> { String }, optional: false, nullable: false
          field :member_id, -> { String }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: false, nullable: false
          field :payer_id, -> { String }, optional: false, nullable: false
          field :rx_bin, -> { String }, optional: true, nullable: false
          field :rx_pcn, -> { String }, optional: true, nullable: false
          field :image_url_front, -> { String }, optional: true, nullable: false
          field :image_url_back, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
