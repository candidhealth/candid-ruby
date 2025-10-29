# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        class Payer < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :payer_ids, -> { Candid::Payers::V4::Types::PrimaryPayerIds }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: false, nullable: false
          field :alternate_payer_names, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :clearinghouse_payer_info, lambda {
            Internal::Types::Hash[Candid::Commons::Types::Clearinghouse, Candid::Payers::V4::Types::ClearinghousePayerInfo]
          }, optional: false, nullable: false
          field :street_address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
        end
      end
    end
  end
end
