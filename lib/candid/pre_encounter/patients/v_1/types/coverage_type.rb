# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module CoverageType
            extend Candid::Internal::Types::Enum

            PRIMARY = "primary"
            SECONDARY = "secondary"
            TERTIARY = "tertiary"
          end
        end
      end
    end
  end
end
