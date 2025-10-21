# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        module CredentialingSpanStatus
          extend Candid::Internal::Types::Enum
          WORK_IN_PROGRESS = "work_in_progress"
          PENDING = "pending"
          EFFECTIVE = "effective"
          EXPIRED = "expired"end
      end
    end
  end
end
