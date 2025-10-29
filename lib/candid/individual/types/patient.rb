# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class Patient < Internal::Types::Model
        field :individual_id, -> { String }, optional: false, nullable: false
        field :phone_numbers, lambda {
          Internal::Types::Array[Candid::Commons::Types::PhoneNumber]
        }, optional: false, nullable: false
        field :phone_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :email_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :auto_charge_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :non_insurance_payers, lambda {
          Internal::Types::Array[Candid::NonInsurancePayers::V1::Types::NonInsurancePayer]
        }, optional: false, nullable: false
        field :non_insurance_payers_info, lambda {
          Internal::Types::Array[Candid::Individual::Types::PatientNonInsurancePayerInfo]
        }, optional: false, nullable: false
      end
    end
  end
end
