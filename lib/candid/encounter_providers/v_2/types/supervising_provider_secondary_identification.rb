# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class SupervisingProviderSecondaryIdentification < Internal::Types::Model
          field :reference_identification, -> { String }, optional: false, nullable: false
          field :reference_identification_qualifier, -> { Candid::EncounterProviders::V2::Types::ProviderSecondaryIdentificationQualifier }, optional: false, nullable: false
        end
      end
    end
  end
end
