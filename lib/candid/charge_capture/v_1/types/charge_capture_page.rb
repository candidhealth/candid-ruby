# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeCapturePage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::ChargeCapture::V1::Types::ChargeCapture]
          }, optional: false, nullable: false
          field :item_count, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
