# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing patient information for an eligibility recommendation. 
          # This is used to find recommendations. Each field helps us find the right corresponding
          # eligibility recommendation for the patient.
          class EligibilityRecommendationPatientInfo < Internal::Types::Model
            field :id, -> { String }, optional: true, nullable: false
            field :mrn, -> { String }, optional: true, nullable: false
            field :organization_id, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
            field :first_name, -> { String }, optional: true, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false
            field :member_id, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
