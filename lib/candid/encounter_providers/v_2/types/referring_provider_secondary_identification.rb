# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class ReferringProviderSecondaryIdentification < Internal::Types::Model
          field :reference_identification, -> { String }, optional: false, nullable: false
          field :reference_identification_qualifier, -> { Candid::EncounterProviders::V2::Types::ReferringProviderSecondaryIdentificationQualifier }, optional: false, nullable: false
        end
      end
    end
  end
end
