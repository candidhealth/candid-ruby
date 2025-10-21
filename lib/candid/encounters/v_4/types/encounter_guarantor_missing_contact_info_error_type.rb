# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterGuarantorMissingContactInfoErrorType < Internal::Types::Model
          field :missing_fields, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        end
      end
    end
  end
end
