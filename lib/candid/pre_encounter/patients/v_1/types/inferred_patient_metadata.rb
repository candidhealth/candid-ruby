# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class InferredPatientMetadata < Internal::Types::Model
            field :inferred_encounter_id, -> { String }, optional: false, nullable: false
            field :inferred_encounter_latest_date_of_service, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
