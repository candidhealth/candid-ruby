# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class RenderingProviderUpdate < Internal::Types::Model
          field :npi, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false

        end
      end
    end
  end
end
