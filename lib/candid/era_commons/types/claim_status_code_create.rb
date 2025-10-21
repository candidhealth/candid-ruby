# frozen_string_literal: true

module Candid
  module EraCommons
    module Types
      module ClaimStatusCodeCreate
        extend Candid::Internal::Types::Enum
        PROCESSED_AS_PRIMARY = "1"
        PROCESSED_AS_SECONDARY = "2"
        PROCESSED_AS_TERTIARY = "3"
        DENIED = "4"
        PROCESSED_AS_PRIMARY_FORWARDED = "19"
        PROCESSED_AS_SECONDARY_FORWARDED = "20"
        PROCESSED_AS_TERTIARY_FORWARDED = "21"
        REVERSAL_OF_PREVIOUS_PAYMENT = "22"
        NOT_OUR_CLAIM_FORWARDED = "23"end
    end
  end
end
