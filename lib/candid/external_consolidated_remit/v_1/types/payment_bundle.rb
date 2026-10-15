# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        class PaymentBundle < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :era_payment_id, -> { String }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :allocation_method, -> { Candid::ExternalConsolidatedRemit::V1::Types::PaymentBundleAllocationMethod }, optional: false, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
