# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        class ExternalConsolidatedRemitEraPayment < Internal::Types::Model
          field :era_payment, -> { Candid::Eras::Types::EraPayment }, optional: false, nullable: false
          field :is_primary, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
