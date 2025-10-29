# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientNonInsurancePayerInfo < Internal::Types::Model
        field :non_insurance_payer, lambda {
          Candid::NonInsurancePayers::V1::Types::NonInsurancePayer
        }, optional: false, nullable: false
        field :member_id, -> { String }, optional: true, nullable: false
        field :clinical_trial_info, lambda {
          Internal::Types::Array[Candid::Individual::Types::PatientClinicalTrialInfo]
        }, optional: false, nullable: false
      end
    end
  end
end
