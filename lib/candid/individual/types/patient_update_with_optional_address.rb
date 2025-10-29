# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientUpdateWithOptionalAddress < Internal::Types::Model
        field :first_name, -> { String }, optional: true, nullable: false
        field :last_name, -> { String }, optional: true, nullable: false
        field :gender, -> { Candid::Individual::Types::Gender }, optional: true, nullable: false
        field :external_id, -> { String }, optional: true, nullable: false
        field :date_of_birth, -> { String }, optional: true, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressShortZipOptional }, optional: true, nullable: false
        field :phone_numbers, lambda {
          Internal::Types::Array[Candid::Commons::Types::PhoneNumberOptional]
        }, optional: true, nullable: false
        field :phone_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :email_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :auto_charge_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :non_insurance_payers, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :non_insurance_payers_info, lambda {
          Internal::Types::Array[Candid::Individual::Types::PatientNonInsurancePayerInfoCreateOptional]
        }, optional: true, nullable: false
      end
    end
  end
end
