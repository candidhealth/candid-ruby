# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        module SupportState
          extend Candid::Internal::Types::Enum

          NOT_SUPPORTED = "NOT_SUPPORTED"
          SUPPORTED_ENROLLMENT_NOT_REQUIRED = "SUPPORTED_ENROLLMENT_NOT_REQUIRED"
          SUPPORTED_ENROLLMENT_REQUIRED = "SUPPORTED_ENROLLMENT_REQUIRED"
        end
      end
    end
  end
end
