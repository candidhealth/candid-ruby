# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class CreateNonInsurancePayerRequest < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :category, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: true, nullable: false
          field :clinical_trials, lambda {
            Internal::Types::Array[Candid::ClinicalTrials::V1::Types::MutableClinicalTrial]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
