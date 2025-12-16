# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class ProviderSecondaryIdentification < Internal::Types::Model
          field :reference_identification, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
