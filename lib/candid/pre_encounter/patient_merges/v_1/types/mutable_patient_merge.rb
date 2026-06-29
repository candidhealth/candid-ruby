# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # An object representing a patient merge mapping.
          class MutablePatientMerge < Internal::Types::Model
            field :alternative_patient_mrn, -> { String }, optional: false, nullable: false
            field :primary_patient_mrn, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
