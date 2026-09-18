# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        module PreServiceRunType
          extend Candid::Internal::Types::Enum

          ENCOUNTER = "ENCOUNTER"
          PATIENT = "PATIENT"
        end
      end
    end
  end
end
