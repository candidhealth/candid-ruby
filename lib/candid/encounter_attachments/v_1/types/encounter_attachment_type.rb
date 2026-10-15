# frozen_string_literal: true

module Candid
  module EncounterAttachments
    module V1
      module Types
        module EncounterAttachmentType
          extend Candid::Internal::Types::Enum

          APPEAL_LETTER = "APPEAL_LETTER"
          CERTIFICATION = "CERTIFICATION"
          CONSENT_FORM = "CONSENT_FORM"
          DOCUMENTATION = "DOCUMENTATION"
          EOB = "EOB"
          JUSTIFICATION_OF_ADMISSION = "JUSTIFICATION_OF_ADMISSION"
          LABORATORY_RESULTS = "LABORATORY_RESULTS"
          MEDICAL_RECORD_ATTACHMENT = "MEDICAL_RECORD_ATTACHMENT"
          OPERATIVE_NOTE = "OPERATIVE_NOTE"
          OTHER = "OTHER"
          PHYSICAL_THERAPY_NOTE = "PHYSICAL_THERAPY_NOTE"
          REFERRAL_FORM = "REFERRAL_FORM"
          SUPPORT_DATA_FOR_CLAIM = "SUPPORT_DATA_FOR_CLAIM"
        end
      end
    end
  end
end
