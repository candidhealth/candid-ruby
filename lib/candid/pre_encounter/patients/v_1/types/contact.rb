# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class Contact < Internal::Types::Model
            field :relationship, lambda {
              Internal::Types::Array[Candid::PreEncounter::Common::Types::Relationship]
            }, optional: false, nullable: false
            field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
            field :telecoms, lambda {
              Internal::Types::Array[Candid::PreEncounter::Common::Types::ContactPoint]
            }, optional: false, nullable: false
            field :addresses, lambda {
              Internal::Types::Array[Candid::PreEncounter::Common::Types::Address]
            }, optional: false, nullable: false
            field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
            field :hipaa_authorization, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
