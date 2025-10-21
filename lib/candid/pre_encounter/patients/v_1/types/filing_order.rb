# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # The patient's active coverages, in order of primary, secondary, etc.
          class FilingOrder < Internal::Types::Model
            field :coverages, -> { Internal::Types::Array[String] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
