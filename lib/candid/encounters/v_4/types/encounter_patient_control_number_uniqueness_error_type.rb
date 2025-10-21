# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterPatientControlNumberUniquenessErrorType < Internal::Types::Model
          field :patient_control_number, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
