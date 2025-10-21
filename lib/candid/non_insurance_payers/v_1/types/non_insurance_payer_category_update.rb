# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerCategoryUpdate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Object }, key: "REMOVE"
          member -> { String }, key: "SET"
        end
      end
    end
  end
end
