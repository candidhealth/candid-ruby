# frozen_string_literal: true

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ServiceType
        NEW_PATIENT_VIDEO_APPT = "new_patient_video_appt"
        NEW_PATIENT_PREV_VIDEO_APPT = "new_patient_prev_video_appt"
        NEW_PATIENT_OFFICE_APPT = "new_patient_office_appt"
        ESTABLISHED_PATIENT_VIDEO_APPT = "established_patient_video_appt"
        ESTABLISHED_PATIENT_PREV_VIDEO_APPT = "established_patient_prev_video_appt"
        ESTABLISHED_PATIENT_OFFICE_APPT = "established_patient_office_appt"
        PATIENT_PORTAL_WITH_QUALIFIED_PHYSICIAN = "patient_portal_with_qualified_physician"
        PATIENT_PORTAL_WITH_NON_QUALIFIED_PHYSICIAN = "patient_portal_with_non_qualified_physician"
        GROUP_THERAPY = "group_therapy"
        PHONE_APPT = "phone_appt"
        ANNUAL_WELLNESS_VISIT = "annual_wellness_visit"
        REMOTE_PATIENT_MONITORING = "remote_patient_monitoring"
        DIAGNOSTIC = "diagnostic"
        CARDIAC_MONITORING = "cardiac_monitoring"
        CARDIAC_CODES = "cardiac_codes"
        PSYCHOTHERAPY = "psychotherapy"
        PHONE_THERAPY = "phone_therapy"
        ALCOHOL_ABUSE = "alcohol_abuse"
        SMOKING_CESSATION = "smoking_cessation"
        SPEECH_THERAPY = "speech_therapy"
        HOME_VISIT = "home_visit"
        MEDICAL_NUTRITION_THERAPY = "medical_nutrition_therapy"
        NUTRITIONAL_COUNSELING = "nutritional_counseling"
        DIETITIAN_VISIT = "dietitian_visit"
        PREVENTATIVE_MEDICINE_COUNSELING = "preventative_medicine_counseling"
        CHRONIC_CARE = "chronic_care"
        ADVANCE_CARE = "advance_care"
        COLLABORATIVE_CARE_MANAGEMENT = "collaborative_care_management"
        ABORTION_CARE = "abortion_care"
        ABORTION_DRUGS = "abortion_drugs"
        REMOTE_THERAPEUTIC_MONITORING = "remote_therapeutic_monitoring"
        PRINCIPAL_CARE_MGMT = "principal_care_mgmt"
        OTHER_EM = "other_em"
        TELEHEALTH_OUD = "telehealth_oud"
        SUBSTANCE_ABUSE_TREATMENT = "substance_abuse_treatment"
        ACUPUNCTURE = "acupuncture"
        PHYSICAL_THERAPY = "physical_therapy"
        LACTATION_CONSULTING = "lactation_consulting"
        SLEEP_STUDY = "sleep_study"
        CMS_TELEHEALTH_CODES = "cms_telehealth_codes"
        CMS_TELEHEALTH_AUDIO_CODES = "cms_telehealth_audio_codes"
      end
    end
  end
end
