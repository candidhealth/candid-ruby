# frozen_string_literal: true

module Candid
  module Claims
    module Types
      class Claim < Internal::Types::Model
        field :claim_id, -> { String }, optional: false, nullable: false
        field :status, -> { Candid::Claims::Types::ClaimStatus }, optional: false, nullable: false
        field :clearinghouse, -> { String }, optional: true, nullable: false
        field :clearinghouse_claim_id, -> { String }, optional: true, nullable: false
        field :payer_claim_id, -> { String }, optional: true, nullable: false
        field :clia_number, -> { String }, optional: true, nullable: false
        field :service_lines, lambda {
          Internal::Types::Array[Candid::ServiceLines::V2::Types::ServiceLine]
        }, optional: false, nullable: false
        field :eras, -> { Internal::Types::Array[Candid::Eras::Types::Era] }, optional: false, nullable: false
      end
    end
  end
end
