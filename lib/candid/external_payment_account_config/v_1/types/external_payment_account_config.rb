# frozen_string_literal: true

module Candid
  module ExternalPaymentAccountConfig
    module V1
      module Types
        class ExternalPaymentAccountConfig < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :account_name, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
