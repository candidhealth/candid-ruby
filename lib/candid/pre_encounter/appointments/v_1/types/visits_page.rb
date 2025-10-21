# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class VisitsPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::Appointments::V1::Types::Visit] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
