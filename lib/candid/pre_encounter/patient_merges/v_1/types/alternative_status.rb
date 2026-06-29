# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # Patient has been merged into another patient.
          class AlternativeStatus < Internal::Types::Model
            field :primary_mrn, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
