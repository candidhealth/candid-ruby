# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class CanonicalNonInsurancePayerAssociation < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :member_id, -> { String }, optional: true, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
          field :clinical_trial_info, lambda {
            Internal::Types::Array[Candid::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
