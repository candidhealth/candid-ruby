# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class ProviderLevelAdjustment < Internal::Types::Model
        field :provider_identifier, -> { String }, optional: false, nullable: false
        field :adjustment_identifier, -> { String }, optional: true, nullable: false
        field :adjustment_code, -> { Candid::Commons::Types::AdjustmentReasonCode }, optional: false, nullable: false
        field :adjustment_amount_cents, -> { Integer }, optional: false, nullable: false
        field :payee_npi, -> { String }, optional: true, nullable: false
        field :payee_tin, -> { String }, optional: true, nullable: false
      end
    end
  end
end
