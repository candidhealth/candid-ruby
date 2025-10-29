# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # A patient object with immutable server-owned properties.
          class Patient < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :mrn, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
