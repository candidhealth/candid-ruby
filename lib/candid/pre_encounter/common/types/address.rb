# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class Address < Internal::Types::Model
          field :use, -> { Candid::PreEncounter::Common::Types::AddressUse }, optional: false, nullable: false
          field :line, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :city, -> { String }, optional: false, nullable: false
          field :state, -> { String }, optional: false, nullable: false
          field :postal_code, -> { String }, optional: false, nullable: false
          field :country, -> { String }, optional: false, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false

        end
      end
    end
  end
end
