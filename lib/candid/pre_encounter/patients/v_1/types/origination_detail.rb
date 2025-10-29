# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class OriginationDetail < Internal::Types::Model
            field :referral_source, lambda {
              Candid::PreEncounter::Patients::V1::Types::ReferralSource
            }, optional: false, nullable: false
            field :referring_provider, lambda {
              Candid::PreEncounter::Common::Types::ExternalProvider
            }, optional: true, nullable: false
            field :specialization_categories, lambda {
              Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::SpecializationCategory]
            }, optional: true, nullable: false
            field :referral_type, lambda {
              Candid::PreEncounter::Patients::V1::Types::ReferralType
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
