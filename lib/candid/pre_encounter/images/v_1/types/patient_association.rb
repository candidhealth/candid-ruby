# frozen_string_literal: true

module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          # An association to a Patient.
          class PatientAssociation < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :notes, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
