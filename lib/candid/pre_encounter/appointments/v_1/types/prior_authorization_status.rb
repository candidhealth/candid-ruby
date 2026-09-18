# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module PriorAuthorizationStatus
            extend Candid::Internal::Types::Enum

            NOT_REQUIRED = "NOT_REQUIRED"
            REQUIRED = "REQUIRED"
            PENDING = "PENDING"
            APPROVED = "APPROVED"
            PARTIALLY_APPROVED = "PARTIALLY_APPROVED"
            DENIED = "DENIED"
            EXPIRED = "EXPIRED"
          end
        end
      end
    end
  end
end
