# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module BillingProviderCommercialLicenseType
        extend Candid::Internal::Types::Enum

        LICENSED_CLINICAL_SOCIAL_WORKER = "0"
        LICENSED_PROFESSIONAL_COUNSELOR = "A"
        LICENSED_MARRIAGE_AND_FAMILY_COUNSELOR = "B"
        LICENSED_CLINICAL_ALCOHOL_AND_DRUG_COUNSELOR = "C"
        PSYCHOLOGIST = "D"
        PSYCHIATRIC_NURSE = "E"
        PSYCHIATRIST = "F"
        CHILD_ADOLESCENT_PSYCHIATRIST = "G"
        PHYSICIAN_ASSISTANT = "H"
        NURSE_CNP = "I"
      end
    end
  end
end
