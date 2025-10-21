# frozen_string_literal: true

module Candid
  module Remits
    module V1
      module Types
        class Payee < Internal::Types::Model
          field :payee_name, -> { String }, optional: false, nullable: false
          field :payee_identifier, -> { Candid::Remits::V1::Types::PayeeIdentifier }, optional: false, nullable: false

        end
      end
    end
  end
end
