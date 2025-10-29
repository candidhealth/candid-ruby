# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class CashPayPayerErrorMessage < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
