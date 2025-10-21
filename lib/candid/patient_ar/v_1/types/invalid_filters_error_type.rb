# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class InvalidFiltersErrorType < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
