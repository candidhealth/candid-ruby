# frozen_string_literal: true

require_relative "../../encounters/v_4/types/encounter_submission_expectation"
require_relative "../../encounter_providers/v_2/types/rendering_provider"
require_relative "../../health_care_code_information/v_1/types/health_care_code_information_create"
require_relative "../../commons/types/facility_type_code"
require_relative "../../service_lines/v_2/types/universal_service_line_create"
require_relative "../../x_12/v_1/types/type_of_admission_or_visit_code"
require_relative "../../x_12/v_1/types/point_of_origin_for_admission_or_visit_code"
require_relative "../../x_12/v_1/types/patient_discharge_status_code"
require_relative "../../x_12/v_1/types/type_of_bill_composite_update"
require_relative "../../commons/types/state"
require_relative "../../encounter_providers/v_2/types/billing_provider"
require_relative "../../encounter_providers/v_2/types/initial_referring_provider"
require_relative "../../encounter_providers/v_2/types/supervising_provider"
require_relative "../../service_facility/types/encounter_service_facility_base"
require_relative "../../encounters/v_4/types/clinical_note_category_create"
require_relative "../../billing_notes/v_2/types/billing_note_base"
require_relative "../../encounters/v_4/types/patient_history_category"
require_relative "../../claim_submission/v_1/types/external_claim_submission_create"
require_relative "../../custom_schemas/v_1/types/schema_instance"
require "date"
require_relative "../../encounters/v_4/types/medication"
require_relative "../../encounters/v_4/types/intervention"
require_relative "../../commons/types/street_address_long_zip"
require_relative "../../encounters/v_4/types/synchronicity_type"
require_relative "../../encounters/v_4/types/vitals"
require_relative "../../encounters/v_4/types/billable_status_type"
require_relative "../../encounters/v_4/types/service_authorization_exception_code"
require_relative "../../commons/types/delay_reason_code"
require "ostruct"
require "json"

module CandidApiClient
  module EncountersUniversal
    module Types
      class UniversalEncounterCreateFromPreEncounter
        # @return [CandidApiClient::Encounters::V4::Types::EncounterSubmissionExpectation] Describes the currently expected target form for this encounter.  This effects
        #  what validations and queues the form is processed under.
        attr_reader :submission_expectation
        # @return [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] The rendering provider is the practitioner -- physician, nurse practitioner,
        #  etc. -- performing the service.
        #  For telehealth services, the rendering provider performs the visit, asynchronous
        #  communication, or other service. The rendering provider address should generally
        #  be the same as the service facility address.
        attr_reader :rendering_provider
        # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate] The health care code information associated with this encounter, which includes
        #  things such as diagnoses, vitals, procedures, occurrences, reason for visit, and
        #  numerous other code related fields.
        attr_reader :health_care_code_information
        # @return [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. This box is not
        #  used on a UB-04 or 837i claim form. 02 for telemedicine, 11 for in-person. Full
        #  list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        attr_reader :place_of_service_code
        # @return [Array<CandidApiClient::ServiceLines::V2::Types::UniversalServiceLineCreate>]
        attr_reader :service_lines
        # @return [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has overall responsibility for the patient in institutional claims processing.
        attr_reader :attending_provider
        # @return [Integer] 837i Loop 2300 DTP-03
        #  Extension of the admission date with hour (0-23 integer) details.
        attr_reader :admission_hour
        # @return [CandidApiClient::X12::V1::Types::TypeOfAdmissionOrVisitCode] 837i Loop 2300 CL1-01 Code used to indicate the priority of an admission or
        #  visit. Equivalent to Form Locator 14 Priority of Admission on a UB-04 claim, not
        #  used on CMS-1500 claim forms.
        attr_reader :admission_type_code
        # @return [CandidApiClient::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode] 837i Loop 2300 CLI1-02 Code used to indicate the conditions under which an
        #  admission occurs. Equivalent to Form Locator 15 Point of Origin on a UB-04
        #  claim, not used on CMS-1500 claim forms.
        attr_reader :admission_source_code
        # @return [Integer] 837i Loop 2300 DTP-03
        #  Extension of the discharge date with hour (0-23 integer) details.
        attr_reader :discharge_hour
        # @return [CandidApiClient::X12::V1::Types::PatientDischargeStatusCode] 837i CL1-03 or Form Locator 17 on a UB-04 claim form. This is a required field
        #  on UB-04 claims.
        #  Code indicating patient status as of the "statement covers through date" .
        attr_reader :discharge_status
        # @return [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has primary responsibility for surgical procedures in institutional claims
        #  processing.
        attr_reader :operating_provider
        # @return [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has secondary responsibility for surgical procedures in institutional claims
        #  processing.  Only used when operating_provider is also set.
        attr_reader :other_operating_provider
        # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate] Four digit code used in institutional forms to indicate the type of bill (e.g.,
        #  hospital inpatient, hospital outpatient). First digit is a leading 0, followed
        #  by the type_of_facility, type_of_care, then frequency_code. Professional forms
        #  are not required to submit this attribute. You may send the 4 digit code via
        #  raw_code, or each individual digit separately via composite_codes.
        attr_reader :type_of_bill
        # @return [CandidApiClient::Commons::Types::State] 837i-REF1000 -- an optional state indicating where an accident related to the
        #  encounter occurred.
        attr_reader :accident_state_or_province_code
        # @return [String]
        attr_reader :pre_encounter_patient_id
        # @return [Array<String>]
        attr_reader :pre_encounter_appointment_ids
        # @return [CandidApiClient::EncounterProviders::V2::Types::BillingProvider] The billing provider is the provider or business entity submitting the claim.
        #  Billing provider may be, but is not necessarily, the same person/NPI as the
        #  rendering provider. From a payer's perspective, this represents the person or
        #  entity being reimbursed. When a contract exists with the target payer, the
        #  billing provider should be the entity contracted with the payer. In some
        #  circumstances, this will be an individual provider. In that case, submit that
        #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
        #  contracting. In other cases, the billing entity will be a medical group. If so,
        #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim or
        #  Form Locator 1 on a UB-04 claim form.
        attr_reader :billing_provider
        # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310 on an 837P form. Use code "P3 - Primary
        #  Care Provider" in this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.
        #  Not used in an 837i claim
        attr_reader :initial_referring_provider
        # @return [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.
        attr_reader :supervising_provider
        # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. There is
        #  no equivalent on the paper UB-04 claim form, but this field is equivalent to
        #  Loop 2310E Service Facility Location details on an 837i form, and is used when
        #  this is different to the entity identified as the Billing Provider. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed
        attr_reader :service_facility
        # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters. Please note that medical records for appeals should be sent
        #  using the Encounter Attachments API.
        attr_reader :clinical_notes
        # @return [Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.
        attr_reader :billing_notes
        # @return [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
        attr_reader :patient_histories
        # @return [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).
        attr_reader :external_claim_submission
        # @return [Array<String>] Names of tags that should be on the encounter.
        attr_reader :tag_ids
        # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.
        attr_reader :schema_instances
        # @return [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        attr_reader :external_id
        # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form or Form Locator 45 on the UB-04 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  date_of_service must be defined on either the encounter or the service lines but
        #  not both.
        #  If there are greater than zero service lines, it is recommended to specify
        #  date_of_service on the service_line instead of on the encounter to prepare for
        #  future API versions.
        attr_reader :date_of_service
        # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If there are greater than zero service lines, it is recommended to specify
        #  end_date_of_service on the service_line instead of on the encounter to prepare
        #  for future API versions.
        attr_reader :end_date_of_service
        # @return [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form  or Form Locator 52 on a UB-04 claim form.
        attr_reader :patient_authorized_release
        # @return [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form or Form Locator 53 on a UB-04 claim form.
        attr_reader :benefits_assigned_to_provider
        # @return [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form. There is no exact equivalent of this field on
        #  a UB-04 claim, however contributes to the concept of Form Locator 53.
        attr_reader :provider_accepts_assignment
        # @return [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        attr_reader :appointment_type
        # @return [Array<CandidApiClient::Encounters::V4::Types::Medication>]
        attr_reader :existing_medications
        # @return [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
        attr_reader :interventions
        # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
        attr_reader :pay_to_address
        # @return [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        attr_reader :synchronicity
        # @return [CandidApiClient::Encounters::V4::Types::Vitals]
        attr_reader :vitals
        # @return [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        attr_reader :billable_status
        # @return [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form or Form Locator 80 on a UB-04 claim form.
        attr_reader :additional_information
        # @return [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        attr_reader :service_authorization_exception_code
        # @return [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18 or UB-04 Form Locator 12.
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        attr_reader :admission_date
        # @return [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18 Required for inpatient claims when the
        #  patient was discharged from the facility and the discharge date is known. Not
        #  used on an institutional claim.
        attr_reader :discharge_date
        # @return [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        #  For UB-04 claims, this is populated separately via occurrence codes.
        attr_reader :onset_of_current_illness_or_symptom_date
        # @return [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        #  This field is populated separately via occurrence codes for UB-04 claim forms.
        attr_reader :last_menstrual_period_date
        # @return [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        attr_reader :delay_reason_code
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param submission_expectation [CandidApiClient::Encounters::V4::Types::EncounterSubmissionExpectation] Describes the currently expected target form for this encounter.  This effects
        #  what validations and queues the form is processed under.
        # @param rendering_provider [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] The rendering provider is the practitioner -- physician, nurse practitioner,
        #  etc. -- performing the service.
        #  For telehealth services, the rendering provider performs the visit, asynchronous
        #  communication, or other service. The rendering provider address should generally
        #  be the same as the service facility address.
        # @param health_care_code_information [CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate] The health care code information associated with this encounter, which includes
        #  things such as diagnoses, vitals, procedures, occurrences, reason for visit, and
        #  numerous other code related fields.
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. This box is not
        #  used on a UB-04 or 837i claim form. 02 for telemedicine, 11 for in-person. Full
        #  list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param service_lines [Array<CandidApiClient::ServiceLines::V2::Types::UniversalServiceLineCreate>]
        # @param attending_provider [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has overall responsibility for the patient in institutional claims processing.
        # @param admission_hour [Integer] 837i Loop 2300 DTP-03
        #  Extension of the admission date with hour (0-23 integer) details.
        # @param admission_type_code [CandidApiClient::X12::V1::Types::TypeOfAdmissionOrVisitCode] 837i Loop 2300 CL1-01 Code used to indicate the priority of an admission or
        #  visit. Equivalent to Form Locator 14 Priority of Admission on a UB-04 claim, not
        #  used on CMS-1500 claim forms.
        # @param admission_source_code [CandidApiClient::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode] 837i Loop 2300 CLI1-02 Code used to indicate the conditions under which an
        #  admission occurs. Equivalent to Form Locator 15 Point of Origin on a UB-04
        #  claim, not used on CMS-1500 claim forms.
        # @param discharge_hour [Integer] 837i Loop 2300 DTP-03
        #  Extension of the discharge date with hour (0-23 integer) details.
        # @param discharge_status [CandidApiClient::X12::V1::Types::PatientDischargeStatusCode] 837i CL1-03 or Form Locator 17 on a UB-04 claim form. This is a required field
        #  on UB-04 claims.
        #  Code indicating patient status as of the "statement covers through date" .
        # @param operating_provider [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has primary responsibility for surgical procedures in institutional claims
        #  processing.
        # @param other_operating_provider [CandidApiClient::EncounterProviders::V2::Types::RenderingProvider] 837i NM1 2500 variant for Loop ID-2310.  Used to indicate the individual whom
        #  has secondary responsibility for surgical procedures in institutional claims
        #  processing.  Only used when operating_provider is also set.
        # @param type_of_bill [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate] Four digit code used in institutional forms to indicate the type of bill (e.g.,
        #  hospital inpatient, hospital outpatient). First digit is a leading 0, followed
        #  by the type_of_facility, type_of_care, then frequency_code. Professional forms
        #  are not required to submit this attribute. You may send the 4 digit code via
        #  raw_code, or each individual digit separately via composite_codes.
        # @param accident_state_or_province_code [CandidApiClient::Commons::Types::State] 837i-REF1000 -- an optional state indicating where an accident related to the
        #  encounter occurred.
        # @param pre_encounter_patient_id [String]
        # @param pre_encounter_appointment_ids [Array<String>]
        # @param billing_provider [CandidApiClient::EncounterProviders::V2::Types::BillingProvider] The billing provider is the provider or business entity submitting the claim.
        #  Billing provider may be, but is not necessarily, the same person/NPI as the
        #  rendering provider. From a payer's perspective, this represents the person or
        #  entity being reimbursed. When a contract exists with the target payer, the
        #  billing provider should be the entity contracted with the payer. In some
        #  circumstances, this will be an individual provider. In that case, submit that
        #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
        #  contracting. In other cases, the billing entity will be a medical group. If so,
        #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim or
        #  Form Locator 1 on a UB-04 claim form.
        # @param initial_referring_provider [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310 on an 837P form. Use code "P3 - Primary
        #  Care Provider" in this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.
        #  Not used in an 837i claim
        # @param supervising_provider [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.
        # @param service_facility [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. There is
        #  no equivalent on the paper UB-04 claim form, but this field is equivalent to
        #  Loop 2310E Service Facility Location details on an 837i form, and is used when
        #  this is different to the entity identified as the Billing Provider. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed
        # @param clinical_notes [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters. Please note that medical records for appeals should be sent
        #  using the Encounter Attachments API.
        # @param billing_notes [Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.
        # @param patient_histories [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
        # @param external_claim_submission [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.
        # @param schema_instances [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.
        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form or Form Locator 45 on the UB-04 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  date_of_service must be defined on either the encounter or the service lines but
        #  not both.
        #  If there are greater than zero service lines, it is recommended to specify
        #  date_of_service on the service_line instead of on the encounter to prepare for
        #  future API versions.
        # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If there are greater than zero service lines, it is recommended to specify
        #  end_date_of_service on the service_line instead of on the encounter to prepare
        #  for future API versions.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form  or Form Locator 52 on a UB-04 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form or Form Locator 53 on a UB-04 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form. There is no exact equivalent of this field on
        #  a UB-04 claim, however contributes to the concept of Form Locator 53.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param existing_medications [Array<CandidApiClient::Encounters::V4::Types::Medication>]
        # @param interventions [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
        # @param pay_to_address [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        # @param vitals [CandidApiClient::Encounters::V4::Types::Vitals]
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form or Form Locator 80 on a UB-04 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18 or UB-04 Form Locator 12.
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18 Required for inpatient claims when the
        #  patient was discharged from the facility and the discharge date is known. Not
        #  used on an institutional claim.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        #  For UB-04 claims, this is populated separately via occurrence codes.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        #  This field is populated separately via occurrence codes for UB-04 claim forms.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::EncountersUniversal::Types::UniversalEncounterCreateFromPreEncounter]
        def initialize(submission_expectation:, pre_encounter_patient_id:, pre_encounter_appointment_ids:, billing_provider:, external_id:, patient_authorized_release:, benefits_assigned_to_provider:, provider_accepts_assignment:, billable_status:, rendering_provider: OMIT, health_care_code_information: OMIT,
                       place_of_service_code: OMIT, service_lines: OMIT, attending_provider: OMIT, admission_hour: OMIT, admission_type_code: OMIT, admission_source_code: OMIT, discharge_hour: OMIT, discharge_status: OMIT, operating_provider: OMIT, other_operating_provider: OMIT, type_of_bill: OMIT, accident_state_or_province_code: OMIT, initial_referring_provider: OMIT, supervising_provider: OMIT, service_facility: OMIT, clinical_notes: OMIT, billing_notes: OMIT, patient_histories: OMIT, external_claim_submission: OMIT, tag_ids: OMIT, schema_instances: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, appointment_type: OMIT, existing_medications: OMIT, interventions: OMIT, pay_to_address: OMIT, synchronicity: OMIT, vitals: OMIT, additional_information: OMIT, service_authorization_exception_code: OMIT, admission_date: OMIT, discharge_date: OMIT, onset_of_current_illness_or_symptom_date: OMIT, last_menstrual_period_date: OMIT, delay_reason_code: OMIT, additional_properties: nil)
          @submission_expectation = submission_expectation
          @rendering_provider = rendering_provider if rendering_provider != OMIT
          @health_care_code_information = health_care_code_information if health_care_code_information != OMIT
          @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
          @service_lines = service_lines if service_lines != OMIT
          @attending_provider = attending_provider if attending_provider != OMIT
          @admission_hour = admission_hour if admission_hour != OMIT
          @admission_type_code = admission_type_code if admission_type_code != OMIT
          @admission_source_code = admission_source_code if admission_source_code != OMIT
          @discharge_hour = discharge_hour if discharge_hour != OMIT
          @discharge_status = discharge_status if discharge_status != OMIT
          @operating_provider = operating_provider if operating_provider != OMIT
          @other_operating_provider = other_operating_provider if other_operating_provider != OMIT
          @type_of_bill = type_of_bill if type_of_bill != OMIT
          @accident_state_or_province_code = accident_state_or_province_code if accident_state_or_province_code != OMIT
          @pre_encounter_patient_id = pre_encounter_patient_id
          @pre_encounter_appointment_ids = pre_encounter_appointment_ids
          @billing_provider = billing_provider
          @initial_referring_provider = initial_referring_provider if initial_referring_provider != OMIT
          @supervising_provider = supervising_provider if supervising_provider != OMIT
          @service_facility = service_facility if service_facility != OMIT
          @clinical_notes = clinical_notes if clinical_notes != OMIT
          @billing_notes = billing_notes if billing_notes != OMIT
          @patient_histories = patient_histories if patient_histories != OMIT
          @external_claim_submission = external_claim_submission if external_claim_submission != OMIT
          @tag_ids = tag_ids if tag_ids != OMIT
          @schema_instances = schema_instances if schema_instances != OMIT
          @external_id = external_id
          @date_of_service = date_of_service if date_of_service != OMIT
          @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
          @patient_authorized_release = patient_authorized_release
          @benefits_assigned_to_provider = benefits_assigned_to_provider
          @provider_accepts_assignment = provider_accepts_assignment
          @appointment_type = appointment_type if appointment_type != OMIT
          @existing_medications = existing_medications if existing_medications != OMIT
          @interventions = interventions if interventions != OMIT
          @pay_to_address = pay_to_address if pay_to_address != OMIT
          @synchronicity = synchronicity if synchronicity != OMIT
          @vitals = vitals if vitals != OMIT
          @billable_status = billable_status
          @additional_information = additional_information if additional_information != OMIT
          if service_authorization_exception_code != OMIT
            @service_authorization_exception_code = service_authorization_exception_code
          end
          @admission_date = admission_date if admission_date != OMIT
          @discharge_date = discharge_date if discharge_date != OMIT
          if onset_of_current_illness_or_symptom_date != OMIT
            @onset_of_current_illness_or_symptom_date = onset_of_current_illness_or_symptom_date
          end
          @last_menstrual_period_date = last_menstrual_period_date if last_menstrual_period_date != OMIT
          @delay_reason_code = delay_reason_code if delay_reason_code != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "submission_expectation": submission_expectation,
            "rendering_provider": rendering_provider,
            "health_care_code_information": health_care_code_information,
            "place_of_service_code": place_of_service_code,
            "service_lines": service_lines,
            "attending_provider": attending_provider,
            "admission_hour": admission_hour,
            "admission_type_code": admission_type_code,
            "admission_source_code": admission_source_code,
            "discharge_hour": discharge_hour,
            "discharge_status": discharge_status,
            "operating_provider": operating_provider,
            "other_operating_provider": other_operating_provider,
            "type_of_bill": type_of_bill,
            "accident_state_or_province_code": accident_state_or_province_code,
            "pre_encounter_patient_id": pre_encounter_patient_id,
            "pre_encounter_appointment_ids": pre_encounter_appointment_ids,
            "billing_provider": billing_provider,
            "initial_referring_provider": initial_referring_provider,
            "supervising_provider": supervising_provider,
            "service_facility": service_facility,
            "clinical_notes": clinical_notes,
            "billing_notes": billing_notes,
            "patient_histories": patient_histories,
            "external_claim_submission": external_claim_submission,
            "tag_ids": tag_ids,
            "schema_instances": schema_instances,
            "external_id": external_id,
            "date_of_service": date_of_service,
            "end_date_of_service": end_date_of_service,
            "patient_authorized_release": patient_authorized_release,
            "benefits_assigned_to_provider": benefits_assigned_to_provider,
            "provider_accepts_assignment": provider_accepts_assignment,
            "appointment_type": appointment_type,
            "existing_medications": existing_medications,
            "interventions": interventions,
            "pay_to_address": pay_to_address,
            "synchronicity": synchronicity,
            "vitals": vitals,
            "billable_status": billable_status,
            "additional_information": additional_information,
            "service_authorization_exception_code": service_authorization_exception_code,
            "admission_date": admission_date,
            "discharge_date": discharge_date,
            "onset_of_current_illness_or_symptom_date": onset_of_current_illness_or_symptom_date,
            "last_menstrual_period_date": last_menstrual_period_date,
            "delay_reason_code": delay_reason_code
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of
        #  UniversalEncounterCreateFromPreEncounter
        #
        # @param json_object [String]
        # @return [CandidApiClient::EncountersUniversal::Types::UniversalEncounterCreateFromPreEncounter]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          submission_expectation = struct["submission_expectation"]
          if parsed_json["rendering_provider"].nil?
            rendering_provider = nil
          else
            rendering_provider = parsed_json["rendering_provider"].to_json
            rendering_provider = CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.from_json(json_object: rendering_provider)
          end
          if parsed_json["health_care_code_information"].nil?
            health_care_code_information = nil
          else
            health_care_code_information = parsed_json["health_care_code_information"].to_json
            health_care_code_information = CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate.from_json(json_object: health_care_code_information)
          end
          place_of_service_code = struct["place_of_service_code"]
          service_lines = parsed_json["service_lines"]&.map do |item|
            item = item.to_json
            CandidApiClient::ServiceLines::V2::Types::UniversalServiceLineCreate.from_json(json_object: item)
          end
          if parsed_json["attending_provider"].nil?
            attending_provider = nil
          else
            attending_provider = parsed_json["attending_provider"].to_json
            attending_provider = CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.from_json(json_object: attending_provider)
          end
          admission_hour = struct["admission_hour"]
          admission_type_code = struct["admission_type_code"]
          admission_source_code = struct["admission_source_code"]
          discharge_hour = struct["discharge_hour"]
          discharge_status = struct["discharge_status"]
          if parsed_json["operating_provider"].nil?
            operating_provider = nil
          else
            operating_provider = parsed_json["operating_provider"].to_json
            operating_provider = CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.from_json(json_object: operating_provider)
          end
          if parsed_json["other_operating_provider"].nil?
            other_operating_provider = nil
          else
            other_operating_provider = parsed_json["other_operating_provider"].to_json
            other_operating_provider = CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.from_json(json_object: other_operating_provider)
          end
          if parsed_json["type_of_bill"].nil?
            type_of_bill = nil
          else
            type_of_bill = parsed_json["type_of_bill"].to_json
            type_of_bill = CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate.from_json(json_object: type_of_bill)
          end
          accident_state_or_province_code = struct["accident_state_or_province_code"]
          pre_encounter_patient_id = struct["pre_encounter_patient_id"]
          pre_encounter_appointment_ids = struct["pre_encounter_appointment_ids"]
          if parsed_json["billing_provider"].nil?
            billing_provider = nil
          else
            billing_provider = parsed_json["billing_provider"].to_json
            billing_provider = CandidApiClient::EncounterProviders::V2::Types::BillingProvider.from_json(json_object: billing_provider)
          end
          if parsed_json["initial_referring_provider"].nil?
            initial_referring_provider = nil
          else
            initial_referring_provider = parsed_json["initial_referring_provider"].to_json
            initial_referring_provider = CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.from_json(json_object: initial_referring_provider)
          end
          if parsed_json["supervising_provider"].nil?
            supervising_provider = nil
          else
            supervising_provider = parsed_json["supervising_provider"].to_json
            supervising_provider = CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.from_json(json_object: supervising_provider)
          end
          if parsed_json["service_facility"].nil?
            service_facility = nil
          else
            service_facility = parsed_json["service_facility"].to_json
            service_facility = CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase.from_json(json_object: service_facility)
          end
          clinical_notes = parsed_json["clinical_notes"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate.from_json(json_object: item)
          end
          billing_notes = parsed_json["billing_notes"]&.map do |item|
            item = item.to_json
            CandidApiClient::BillingNotes::V2::Types::BillingNoteBase.from_json(json_object: item)
          end
          patient_histories = parsed_json["patient_histories"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::PatientHistoryCategory.from_json(json_object: item)
          end
          if parsed_json["external_claim_submission"].nil?
            external_claim_submission = nil
          else
            external_claim_submission = parsed_json["external_claim_submission"].to_json
            external_claim_submission = CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.from_json(json_object: external_claim_submission)
          end
          tag_ids = struct["tag_ids"]
          schema_instances = parsed_json["schema_instances"]&.map do |item|
            item = item.to_json
            CandidApiClient::CustomSchemas::V1::Types::SchemaInstance.from_json(json_object: item)
          end
          external_id = struct["external_id"]
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                  Date.parse(parsed_json["end_date_of_service"])
                                end
          patient_authorized_release = struct["patient_authorized_release"]
          benefits_assigned_to_provider = struct["benefits_assigned_to_provider"]
          provider_accepts_assignment = struct["provider_accepts_assignment"]
          appointment_type = struct["appointment_type"]
          existing_medications = parsed_json["existing_medications"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::Medication.from_json(json_object: item)
          end
          interventions = parsed_json["interventions"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::Intervention.from_json(json_object: item)
          end
          if parsed_json["pay_to_address"].nil?
            pay_to_address = nil
          else
            pay_to_address = parsed_json["pay_to_address"].to_json
            pay_to_address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: pay_to_address)
          end
          synchronicity = struct["synchronicity"]
          if parsed_json["vitals"].nil?
            vitals = nil
          else
            vitals = parsed_json["vitals"].to_json
            vitals = CandidApiClient::Encounters::V4::Types::Vitals.from_json(json_object: vitals)
          end
          billable_status = struct["billable_status"]
          additional_information = struct["additional_information"]
          service_authorization_exception_code = struct["service_authorization_exception_code"]
          admission_date = (Date.parse(parsed_json["admission_date"]) unless parsed_json["admission_date"].nil?)
          discharge_date = (Date.parse(parsed_json["discharge_date"]) unless parsed_json["discharge_date"].nil?)
          onset_of_current_illness_or_symptom_date = unless parsed_json["onset_of_current_illness_or_symptom_date"].nil?
                                                       Date.parse(parsed_json["onset_of_current_illness_or_symptom_date"])
                                                     end
          last_menstrual_period_date = unless parsed_json["last_menstrual_period_date"].nil?
                                         Date.parse(parsed_json["last_menstrual_period_date"])
                                       end
          delay_reason_code = struct["delay_reason_code"]
          new(
            submission_expectation: submission_expectation,
            rendering_provider: rendering_provider,
            health_care_code_information: health_care_code_information,
            place_of_service_code: place_of_service_code,
            service_lines: service_lines,
            attending_provider: attending_provider,
            admission_hour: admission_hour,
            admission_type_code: admission_type_code,
            admission_source_code: admission_source_code,
            discharge_hour: discharge_hour,
            discharge_status: discharge_status,
            operating_provider: operating_provider,
            other_operating_provider: other_operating_provider,
            type_of_bill: type_of_bill,
            accident_state_or_province_code: accident_state_or_province_code,
            pre_encounter_patient_id: pre_encounter_patient_id,
            pre_encounter_appointment_ids: pre_encounter_appointment_ids,
            billing_provider: billing_provider,
            initial_referring_provider: initial_referring_provider,
            supervising_provider: supervising_provider,
            service_facility: service_facility,
            clinical_notes: clinical_notes,
            billing_notes: billing_notes,
            patient_histories: patient_histories,
            external_claim_submission: external_claim_submission,
            tag_ids: tag_ids,
            schema_instances: schema_instances,
            external_id: external_id,
            date_of_service: date_of_service,
            end_date_of_service: end_date_of_service,
            patient_authorized_release: patient_authorized_release,
            benefits_assigned_to_provider: benefits_assigned_to_provider,
            provider_accepts_assignment: provider_accepts_assignment,
            appointment_type: appointment_type,
            existing_medications: existing_medications,
            interventions: interventions,
            pay_to_address: pay_to_address,
            synchronicity: synchronicity,
            vitals: vitals,
            billable_status: billable_status,
            additional_information: additional_information,
            service_authorization_exception_code: service_authorization_exception_code,
            admission_date: admission_date,
            discharge_date: discharge_date,
            onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
            last_menstrual_period_date: last_menstrual_period_date,
            delay_reason_code: delay_reason_code,
            additional_properties: struct
          )
        end

        # Serialize an instance of UniversalEncounterCreateFromPreEncounter to a JSON
        #  object
        #
        # @return [String]
        def to_json(*_args)
          @_field_set&.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given
        #  hash and check each fields type against the current object's property
        #  definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.submission_expectation.is_a?(CandidApiClient::Encounters::V4::Types::EncounterSubmissionExpectation) != false || raise("Passed value for field obj.submission_expectation is not the expected type, validation failed.")
          obj.rendering_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.validate_raw(obj: obj.rendering_provider)
          obj.health_care_code_information.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate.validate_raw(obj: obj.health_care_code_information)
          obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
          obj.service_lines&.is_a?(Array) != false || raise("Passed value for field obj.service_lines is not the expected type, validation failed.")
          obj.attending_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.validate_raw(obj: obj.attending_provider)
          obj.admission_hour&.is_a?(Integer) != false || raise("Passed value for field obj.admission_hour is not the expected type, validation failed.")
          obj.admission_type_code&.is_a?(CandidApiClient::X12::V1::Types::TypeOfAdmissionOrVisitCode) != false || raise("Passed value for field obj.admission_type_code is not the expected type, validation failed.")
          obj.admission_source_code&.is_a?(CandidApiClient::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode) != false || raise("Passed value for field obj.admission_source_code is not the expected type, validation failed.")
          obj.discharge_hour&.is_a?(Integer) != false || raise("Passed value for field obj.discharge_hour is not the expected type, validation failed.")
          obj.discharge_status&.is_a?(CandidApiClient::X12::V1::Types::PatientDischargeStatusCode) != false || raise("Passed value for field obj.discharge_status is not the expected type, validation failed.")
          obj.operating_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.validate_raw(obj: obj.operating_provider)
          obj.other_operating_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::RenderingProvider.validate_raw(obj: obj.other_operating_provider)
          obj.type_of_bill.nil? || CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate.validate_raw(obj: obj.type_of_bill)
          obj.accident_state_or_province_code&.is_a?(CandidApiClient::Commons::Types::State) != false || raise("Passed value for field obj.accident_state_or_province_code is not the expected type, validation failed.")
          obj.pre_encounter_patient_id.is_a?(String) != false || raise("Passed value for field obj.pre_encounter_patient_id is not the expected type, validation failed.")
          obj.pre_encounter_appointment_ids.is_a?(Array) != false || raise("Passed value for field obj.pre_encounter_appointment_ids is not the expected type, validation failed.")
          CandidApiClient::EncounterProviders::V2::Types::BillingProvider.validate_raw(obj: obj.billing_provider)
          obj.initial_referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.validate_raw(obj: obj.initial_referring_provider)
          obj.supervising_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.validate_raw(obj: obj.supervising_provider)
          obj.service_facility.nil? || CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase.validate_raw(obj: obj.service_facility)
          obj.clinical_notes&.is_a?(Array) != false || raise("Passed value for field obj.clinical_notes is not the expected type, validation failed.")
          obj.billing_notes&.is_a?(Array) != false || raise("Passed value for field obj.billing_notes is not the expected type, validation failed.")
          obj.patient_histories&.is_a?(Array) != false || raise("Passed value for field obj.patient_histories is not the expected type, validation failed.")
          obj.external_claim_submission.nil? || CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.validate_raw(obj: obj.external_claim_submission)
          obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
          obj.schema_instances&.is_a?(Array) != false || raise("Passed value for field obj.schema_instances is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
          obj.patient_authorized_release.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
          obj.benefits_assigned_to_provider.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
          obj.provider_accepts_assignment.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
          obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
          obj.existing_medications&.is_a?(Array) != false || raise("Passed value for field obj.existing_medications is not the expected type, validation failed.")
          obj.interventions&.is_a?(Array) != false || raise("Passed value for field obj.interventions is not the expected type, validation failed.")
          obj.pay_to_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.pay_to_address)
          obj.synchronicity&.is_a?(CandidApiClient::Encounters::V4::Types::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
          obj.vitals.nil? || CandidApiClient::Encounters::V4::Types::Vitals.validate_raw(obj: obj.vitals)
          obj.billable_status.is_a?(CandidApiClient::Encounters::V4::Types::BillableStatusType) != false || raise("Passed value for field obj.billable_status is not the expected type, validation failed.")
          obj.additional_information&.is_a?(String) != false || raise("Passed value for field obj.additional_information is not the expected type, validation failed.")
          obj.service_authorization_exception_code&.is_a?(CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode) != false || raise("Passed value for field obj.service_authorization_exception_code is not the expected type, validation failed.")
          obj.admission_date&.is_a?(Date) != false || raise("Passed value for field obj.admission_date is not the expected type, validation failed.")
          obj.discharge_date&.is_a?(Date) != false || raise("Passed value for field obj.discharge_date is not the expected type, validation failed.")
          obj.onset_of_current_illness_or_symptom_date&.is_a?(Date) != false || raise("Passed value for field obj.onset_of_current_illness_or_symptom_date is not the expected type, validation failed.")
          obj.last_menstrual_period_date&.is_a?(Date) != false || raise("Passed value for field obj.last_menstrual_period_date is not the expected type, validation failed.")
          obj.delay_reason_code&.is_a?(CandidApiClient::Commons::Types::DelayReasonCode) != false || raise("Passed value for field obj.delay_reason_code is not the expected type, validation failed.")
        end
      end
    end
  end
end
