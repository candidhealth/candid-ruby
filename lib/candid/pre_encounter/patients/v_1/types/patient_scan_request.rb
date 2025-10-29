# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PatientScanRequest < Internal::Types::Model
            field :since, -> { String }, optional: false, nullable: false
            field :max_results, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
