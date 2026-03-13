# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class InitialReferringProvider < Internal::Types::Model
          field :npi, -> { String }, optional: false, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :qualifier, -> { Candid::Commons::Types::QualifierCode }, optional: true, nullable: false
          field :secondary_identification, -> { Candid::EncounterProviders::V2::Types::ReferringProviderSecondaryIdentification }, optional: true, nullable: false
        end
      end
    end
  end
end
