# frozen_string_literal: true

module Candid
  module ClaimAppeals
    module V1
      module Types
        module ClaimAppealStatus
          extend Candid::Internal::Types::Enum

          APPEALABLE = "appealable"
          PREPARING = "preparing"
          SUBMITTED = "submitted"
          REQUIRES_ADDITIONAL_INFO = "requires_additional_info"
          OVERTURNED = "overturned"
          UPHELD = "upheld"
          DISMISSED = "dismissed"
          DISCARDED = "discarded"
        end
      end
    end
  end
end
