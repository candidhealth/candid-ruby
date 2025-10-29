# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeExternalIdConflictErrorMessage < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
