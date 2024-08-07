# frozen_string_literal: true

module CandidApiClient
  module EraCommons
    module Types
      # See https://www.stedi.com/edi/x12/element/1029
      class ClaimStatusCodeCreate
        PROCESSED_AS_PRIMARY = "1"
        PROCESSED_AS_SECONDARY = "2"
        PROCESSED_AS_TERTIARY = "3"
        DENIED = "4"
        PROCESSED_AS_PRIMARY_FORWARDED = "19"
        PROCESSED_AS_SECONDARY_FORWARDED = "20"
        PROCESSED_AS_TERTIARY_FORWARDED = "21"
        REVERSAL_OF_PREVIOUS_PAYMENT = "22"
        NOT_OUR_CLAIM_FORWARDED = "23"
      end
    end
  end
end
