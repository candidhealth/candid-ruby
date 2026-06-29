# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # A PatientMerge object with immutable server-owned properties.
          class PatientMerge < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
