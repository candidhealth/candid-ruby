# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        module TargetType
          extend Candid::Internal::Types::Enum

          ORGANIZATION = "ORGANIZATION"
          PROVIDER = "PROVIDER"
          EXTERNAL_PROVIDER = "EXTERNAL_PROVIDER"
          CLAIM = "CLAIM"
          SERVICE_LINE = "SERVICE_LINE"
          APPOINTMENT = "APPOINTMENT"
        end
      end
    end
  end
end
