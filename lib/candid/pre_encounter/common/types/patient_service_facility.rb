# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        # Represents a canonical service facility attached to a patient or patient dependent object
        class PatientServiceFacility < Internal::Types::Model
          field :service_facility_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
