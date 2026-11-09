# frozen_string_literal: true

module Candid
  module PayerGroups
    module V1
      module Types
        class MutablePayerGroup < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
