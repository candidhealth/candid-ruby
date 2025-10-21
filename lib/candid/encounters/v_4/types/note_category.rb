# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        module NoteCategory
          extend Candid::Internal::Types::Enum
          CLINICAL = "clinical"
          CARE_PLAN = "care_plan"
          DIAGNOSES = "diagnoses"
          VITALS = "vitals"
          PHYSICAL_EXAM = "physical_exam"
          REVIEW_OF_SYSTEMS = "review_of_systems"
          MEDICAL_DECISIONS = "medical_decisions"
          HISTORY_OF_PRESENT_ILLNESS = "history_of_present_illness"
          PATIENT_INFO = "patient_info"
          CHIEF_COMPLAINT = "chief_complaint"
          HEALTH_RECORD = "health_record"
          CONSENT = "consent"
          PROCEDURE = "procedure"
          TIME_IN_APPOINTMENT = "time_in_appointment"end
      end
    end
  end
end
