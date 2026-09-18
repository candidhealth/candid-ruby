# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PotentialDuplicatePatient < Internal::Types::Model
            field :existing_patient_id, -> { String }, optional: false, nullable: false
            field :existing_patient_mrn, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
