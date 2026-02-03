# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # Additional coverages for the patient applicable to related causes such as Auto or Workers Comp
          class CoveragesForRelatedCauses < Internal::Types::Model
            field :coverages, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
