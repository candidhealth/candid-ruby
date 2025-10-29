# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerUpdateRequest < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false
          field :description, lambda {
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerDescriptionUpdate
          }, optional: true, nullable: false
          field :category, lambda {
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoryUpdate
          }, optional: true, nullable: false
          field :address, lambda {
            Candid::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate
          }, optional: true, nullable: false
        end
      end
    end
  end
end
