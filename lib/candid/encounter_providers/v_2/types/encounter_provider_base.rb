# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class EncounterProviderBase < Internal::Types::Model
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
          field :organization_name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
