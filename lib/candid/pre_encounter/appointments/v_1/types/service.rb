# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class Service < Internal::Types::Model
            field :universal_service_identifier, -> { Candid::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier }, optional: true, nullable: false
            field :start_timestamp, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
