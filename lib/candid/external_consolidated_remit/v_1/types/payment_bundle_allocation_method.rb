# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        module PaymentBundleAllocationMethod
          extend Candid::Internal::Types::Enum

          AUTO_ALLOCATED_ORGANIZATION = "auto_allocated_organization"
          USER_ALLOCATED_SERVICE_LINE = "user_allocated_service_line"
          USER_ALLOCATED_CLEARING = "user_allocated_clearing"
          USER_ALLOCATED_EXTERNAL = "user_allocated_external"
        end
      end
    end
  end
end
