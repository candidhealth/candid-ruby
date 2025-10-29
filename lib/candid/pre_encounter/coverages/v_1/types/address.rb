# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class Address < Internal::Types::Model
            field :address_1, -> { String }, optional: true, nullable: false
            field :address_2, -> { String }, optional: true, nullable: false
            field :city, -> { String }, optional: true, nullable: false
            field :state, -> { String }, optional: true, nullable: false
            field :postal_code, -> { String }, optional: true, nullable: false
            field :country_code, -> { String }, optional: true, nullable: false
            field :country_sub_division_code, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
