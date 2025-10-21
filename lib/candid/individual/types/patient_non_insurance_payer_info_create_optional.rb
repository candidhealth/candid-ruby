# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientNonInsurancePayerInfoCreateOptional < Internal::Types::Model
        field :non_insurance_payer_id, -> { String }, optional: true, nullable: false
        field :member_id, -> { String }, optional: true, nullable: false
        field :clinical_trial_info, -> { Internal::Types::Array[Candid::Individual::Types::PatientClinicalTrialInfoCreate] }, optional: true, nullable: false

      end
    end
  end
end
