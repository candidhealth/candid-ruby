# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        module TestResultType
          extend Candid::Internal::Types::Enum

          HEMATOCRIT = "HEMATOCRIT"
          HEMOGLOBIN = "HEMOGLOBIN"
          LDL = "LDL"
          VITAMIN_D = "VITAMIN_D"
        end
      end
    end
  end
end
