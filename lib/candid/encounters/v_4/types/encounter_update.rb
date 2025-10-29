# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterUpdate < Internal::Types::Model
          field :vitals, -> { Candid::Encounters::V4::Types::VitalsUpdate }, optional: true, nullable: false
          field :diagnosis_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
