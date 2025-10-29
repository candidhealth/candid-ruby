# frozen_string_literal: true

module Candid
  module Payers
    module V3
      module Types
        class PayerInfo < Internal::Types::Model
          field :payer_id, -> { String }, optional: false, nullable: false
          field :payer_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
