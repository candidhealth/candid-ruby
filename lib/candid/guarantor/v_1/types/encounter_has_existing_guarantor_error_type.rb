# frozen_string_literal: true

module Candid
  module Guarantor
    module V1
      module Types
        class EncounterHasExistingGuarantorErrorType < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
