# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayer < Internal::Types::Model
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :category, -> { String }, optional: true, nullable: false
          field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: true, nullable: false
          field :clinical_trials, lambda {
            Internal::Types::Array[Candid::ClinicalTrials::V1::Types::ClinicalTrial]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
