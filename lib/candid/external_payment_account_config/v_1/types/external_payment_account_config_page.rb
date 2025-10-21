# frozen_string_literal: true

module Candid
  module ExternalPaymentAccountConfig
    module V1
      module Types
        class ExternalPaymentAccountConfigPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfig] }, optional: false, nullable: false

        end
      end
    end
  end
end
