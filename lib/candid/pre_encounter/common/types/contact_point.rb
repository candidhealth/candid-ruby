# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class ContactPoint < Internal::Types::Model
          field :value, -> { String }, optional: false, nullable: false
          field :use, -> { Candid::PreEncounter::Common::Types::ContactPointUse }, optional: false, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false

        end
      end
    end
  end
end
