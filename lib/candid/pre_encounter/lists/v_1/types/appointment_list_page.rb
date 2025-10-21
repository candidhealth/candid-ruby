# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class AppointmentListPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::Lists::V1::Types::AppointmentListItem] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
