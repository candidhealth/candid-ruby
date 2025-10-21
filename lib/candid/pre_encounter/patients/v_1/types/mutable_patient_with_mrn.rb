# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class MutablePatientWithMrn < Internal::Types::Model
            field :mrn, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
