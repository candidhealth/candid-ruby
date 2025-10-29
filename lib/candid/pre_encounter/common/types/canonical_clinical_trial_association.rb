# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class CanonicalClinicalTrialAssociation < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :clinical_trial_arm, -> { String }, optional: true, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
        end
      end
    end
  end
end
