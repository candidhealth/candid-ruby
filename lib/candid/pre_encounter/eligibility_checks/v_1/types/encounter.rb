# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Encounter < Internal::Types::Model
            field :date_of_service, -> { String }, optional: true, nullable: false
            field :service_type_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
