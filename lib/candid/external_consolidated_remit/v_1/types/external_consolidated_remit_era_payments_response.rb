# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        class ExternalConsolidatedRemitEraPaymentsResponse < Internal::Types::Model
          field :consolidated_remit_id, -> { String }, optional: false, nullable: false
          field :era_payments, -> { Internal::Types::Array[Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitEraPayment] }, optional: false, nullable: false
        end
      end
    end
  end
end
