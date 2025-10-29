# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class Referral < Internal::Types::Model
            field :provider, lambda {
              Candid::PreEncounter::Common::Types::ExternalProvider
            }, optional: false, nullable: false
            field :referral_number, -> { String }, optional: false, nullable: false
            field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
            field :notes, -> { String }, optional: true, nullable: false
            field :service_facility, lambda {
              Candid::PreEncounter::Common::Types::PatientServiceFacility
            }, optional: true, nullable: false
            field :units, lambda {
              Candid::PreEncounter::Patients::V1::Types::ReferralUnit
            }, optional: true, nullable: false
            field :quantity, -> { Integer }, optional: true, nullable: false
            field :cpt_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :apply_for_all_cpt_codes, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
