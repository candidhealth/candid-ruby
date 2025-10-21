# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterExternalIdUniquenessErrorType < Internal::Types::Model
          field :external_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
