# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
