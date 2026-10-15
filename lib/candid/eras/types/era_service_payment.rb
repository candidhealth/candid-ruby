# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class EraServicePayment < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :era_claim_payment_id, -> { String }, optional: false, nullable: false
        field :adjudicated_procedure_code, -> { String }, optional: false, nullable: false
        field :adjudicated_modifiers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :original_procedure_code, -> { String }, optional: true, nullable: false
        field :original_modifiers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :allowed_amount_cents, -> { Integer }, optional: true, nullable: false
        field :line_item_charge_amount_cents, -> { Integer }, optional: false, nullable: false
        field :line_item_provider_payment_amount_cents, -> { Integer }, optional: false, nullable: false
        field :unit_of_service_paid_count, -> { Integer }, optional: true, nullable: false
        field :rarcs, -> { Internal::Types::Array[Candid::X12::V1::Types::RemittanceAdviceRemarkCode] }, optional: false, nullable: false
        field :adjustments, -> { Internal::Types::Array[Candid::Eras::Types::EraAdjustment] }, optional: false, nullable: false
      end
    end
  end
end
