# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          module CoverageStatus
            extend Candid::Internal::Types::Enum

            ACTIVE = "ACTIVE"
            CANCELLED = "CANCELLED"
            DRAFT = "DRAFT"
            ENTERED_IN_ERROR = "ENTERED_IN_ERROR"
          end
        end
      end
    end
  end
end
