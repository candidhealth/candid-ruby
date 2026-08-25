# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # A page of patient merge records.
          class PatientMergePage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::PatientMerges::V1::Types::PatientMerge] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
