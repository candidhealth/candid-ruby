# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientClinicalTrialInfoCreateOptional < Internal::Types::Model
        field :clinical_trial_arm, -> { String }, optional: true, nullable: false
        field :clinical_trial_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
