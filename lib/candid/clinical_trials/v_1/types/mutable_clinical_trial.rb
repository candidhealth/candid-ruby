# frozen_string_literal: true

module Candid
  module ClinicalTrials
    module V1
      module Types
        class MutableClinicalTrial < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :clinical_trial_number, -> { String }, optional: false, nullable: false
          field :clinical_trial_phase, -> { Candid::ClinicalTrials::V1::Types::ClinicalTrialPhase }, optional: true, nullable: false

        end
      end
    end
  end
end
