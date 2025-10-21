# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class HumanName < Internal::Types::Model
          field :family, -> { String }, optional: false, nullable: false
          field :given, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :use, -> { Candid::PreEncounter::Common::Types::NameUse }, optional: false, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
          field :suffix, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
