# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientClinicalTrialInfo < Internal::Types::Model
        field :clinical_trial_arm, -> { String }, optional: true, nullable: false
        field :clinical_trial, -> { Candid::ClinicalTrials::V1::Types::ClinicalTrial }, optional: false, nullable: false

      end
    end
  end
end
