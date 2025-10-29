# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerCategoriesPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
