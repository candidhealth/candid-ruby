# frozen_string_literal: true

module Candid
  module Superbills
    module V1
      module Types
        class SuperbillResponse < Internal::Types::Model
          field :superbills, -> { Internal::Types::Array[Candid::Superbills::V1::Types::Superbill] }, optional: false, nullable: false

        end
      end
    end
  end
end
