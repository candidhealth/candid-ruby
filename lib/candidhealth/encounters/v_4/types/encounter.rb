# frozen_string_literal: true

require_relative "../../../claims/types/claim"
require_relative "../../../individual/types/patient"
require_relative "../../../guarantor/v_1/types/guarantor"
require_relative "../../../encounter_providers/v_2/types/encounter_provider"
require_relative "../../../service_facility/types/encounter_service_facility"
require_relative "../../../individual/types/subscriber"
require_relative "responsible_party_type"
require_relative "../../../diagnoses/types/diagnosis"
require_relative "clinical_note_category"
require_relative "../../../billing_notes/v_2/types/billing_note"
require_relative "../../../commons/types/facility_type_code"
require_relative "patient_history_category"
require_relative "../../../patient_payments/v_3/types/patient_payment"
require_relative "../../../tags/types/tag"
require_relative "coding_attribution_type"
require "date"
require_relative "encounter_owner_of_next_action_type"
require_relative "encounter_submission_origin_type"
require_relative "../../../custom_schemas/v_1/types/schema_instance"
require_relative "epsdt_referral"
require_relative "claim_supplemental_information"
require_relative "medication"
require_relative "vitals"
require_relative "intervention"
require_relative "../../../commons/types/street_address_long_zip"
require_relative "synchronicity_type"
require_relative "billable_status_type"
require_relative "service_authorization_exception_code"
require_relative "../../../commons/types/delay_reason_code"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class Encounter
          # @return [String] A patient control number (PCN) is a unique identifier assigned to a patient
          #  within a healthcare system or facility.
          #  It's used to track and manage a patient's medical records, treatments, and other
          #  healthcare-related information.
          attr_reader :patient_control_number
          # @return [String]
          attr_reader :encounter_id
          # @return [Array<CandidApiClient::Claims::Types::Claim>]
          attr_reader :claims
          # @return [CandidApiClient::Individual::Types::Patient] Contains the identification information of the individual receiving medical
          #  services.
          attr_reader :patient
          # @return [CandidApiClient::Guarantor::V1::Types::Guarantor] Personal and contact info for the guarantor of the patient responsibility.
          attr_reader :guarantor
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider] The billing provider is the provider or business entity submitting the claim.
          #  Billing provider may be, but is not necessarily, the same person/NPI as the
          #  rendering provider. From a payer's perspective, this represents the person or
          #  entity being reimbursed. When a contract exists with the target payer, the
          #  billing provider should be the entity contracted with the payer. In some
          #  circumstances, this will be an individual provider. In that case, submit that
          #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
          #  contracting. In other cases, the billing entity will be a medical group. If so,
          #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
          attr_reader :billing_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider] The rendering provider is the practitioner -- physician, nurse practitioner,
          #  etc. -- performing the service.
          #  For telehealth services, the rendering provider performs the visit, asynchronous
          #  communication, or other service. The rendering provider address should generally
          #  be the same as the service facility address.
          attr_reader :rendering_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          attr_reader :referring_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          attr_reader :initial_referring_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          attr_reader :supervising_provider
          # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility] Encounter Service facility is typically the location a medical service was
          #  rendered, such as a provider office or hospital. For telehealth, service
          #  facility can represent the provider's location when the service was delivered
          #  (e.g., home), or the location where an in-person visit would have taken place,
          #  whichever is easier to identify. If the provider is in-network, service facility
          #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
          #  for an in-network claim to be successfully adjudicated, the service facility
          #  address listed on claims must match what was provided to the payer during the
          #  credentialing process.
          attr_reader :service_facility
          # @return [CandidApiClient::Individual::Types::Subscriber] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
          #  when the claim should be billed to insurance).
          #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
          #  claim should be billed to the patient).
          #  However, if you collect this for patients, even self-pay, we recommend including
          #  it when sending encounters to Candid.
          #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
          #  to define self-pay claims.
          attr_reader :subscriber_primary
          # @return [CandidApiClient::Individual::Types::Subscriber] Contains details of the secondary insurance subscriber.
          attr_reader :subscriber_secondary
          # @return [CandidApiClient::Individual::Types::Subscriber] Contains details of the tertiary insurance subscriber.
          attr_reader :subscriber_tertiary
          # @return [String] Box 23 on the CMS-1500 claim form.
          attr_reader :prior_authorization_number
          # @return [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
          attr_reader :responsible_party
          # @return [String] URL that links directly to the claim created in Candid.
          attr_reader :url
          # @return [Array<CandidApiClient::Diagnoses::Types::Diagnosis>] Ideally, this field should contain no more than 12 diagnoses. However, more
          #  diagnoses may be submitted at this time, and coders will later prioritize the 12
          #  that will be submitted to the payor.
          attr_reader :diagnoses
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategory>] Holds a collection of clinical observations made by healthcare providers during
          #  patient encounters.
          attr_reader :clinical_notes
          # @return [Array<CandidApiClient::BillingNotes::V2::Types::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
          #  used in the billing process.
          attr_reader :billing_notes
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          attr_reader :place_of_service_code
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          attr_reader :place_of_service_code_as_submitted
          # @return [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
          attr_reader :patient_histories
          # @return [Array<CandidApiClient::PatientPayments::V3::Types::PatientPayment>]
          attr_reader :patient_payments
          # @return [Array<CandidApiClient::Tags::Types::Tag>]
          attr_reader :tags
          # @return [CandidApiClient::Encounters::V4::Types::CodingAttributionType] The entity that performed the coding of medical services for the claim.
          attr_reader :coding_attribution
          # @return [String]
          attr_reader :work_queue_id
          # @return [DateTime]
          attr_reader :work_queue_membership_activated_at
          # @return [CandidApiClient::Encounters::V4::Types::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as
          #  defined by ownership of open Tasks.
          attr_reader :owner_of_next_action
          # @return [CandidApiClient::Encounters::V4::Types::EncounterSubmissionOriginType] The party who originally submitted the Claim.
          #  For Claims originating in Candid, this will be
          #  EncounterSubmissionOriginType.CANDID.
          #  For Encounters created with an external_claim_submission object, this will be
          #  EncounterSubmissionOriginType.EXTERNAL.
          attr_reader :submission_origin
          # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
          #  Multiple schema
          #  instances cannot be created for the same schema on an encounter.
          attr_reader :schema_instances
          # @return [String] Refers to REF\*9F on the 837p. Value cannot be greater than 50 characters.
          attr_reader :referral_number
          # @return [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
          #  837P form
          attr_reader :epsdt_referral
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P form. No more than 10 entries are
          #  permitted.
          attr_reader :claim_supplemental_information
          # @return [DateTime] The date and time the encounter was last submitted to a payer.
          attr_reader :last_submitted_at
          # @return [DateTime] The date and time the encounter was created.
          attr_reader :created_at
          # @return [String] A client-specified unique ID to associate with this encounter;
          #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #  This field should not contain PHI.
          attr_reader :external_id
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          #  Box 24a on the CMS-1500 claim form.
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
          #  Box 12 on the CMS-1500 claim form.
          attr_reader :patient_authorized_release
          # @return [Boolean] Whether this patient has authorized insurance payments to be made to you,
          #  not them. If false, patient may receive reimbursement.
          #  Box 13 on the CMS-1500 claim form.
          attr_reader :benefits_assigned_to_provider
          # @return [Boolean] Whether you have accepted the patient's authorization for insurance payments
          #  to be made to you, not them.
          #  Box 27 on the CMS-1500 claim form.
          attr_reader :provider_accepts_assignment
          # @return [String] Human-readable description of the appointment type (ex: "Acupuncture -
          #  Headaches").
          attr_reader :appointment_type
          # @return [Array<CandidApiClient::Encounters::V4::Types::Medication>]
          attr_reader :existing_medications
          # @return [CandidApiClient::Encounters::V4::Types::Vitals]
          attr_reader :vitals
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
          # @return [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include
          #  if the Encounter has not occurred yet or if there is no intention of ever
          #  billing the responsible_party.
          attr_reader :billable_status
          # @return [String] Defines additional information on the claim needed by the payer.
          #  Box 19 on the CMS-1500 claim form.
          attr_reader :additional_information
          # @return [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
          #  Required when mandated by government law or regulation to obtain authorization
          #  for specific service(s) but, for the
          #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
          #  the service was performed without
          #  obtaining the authorization.
          attr_reader :service_authorization_exception_code
          # @return [Date] 837p Loop2300 DTP\*435, CMS-1500 Box 18
          #  Required on all ambulance claims when the patient was known to be admitted to
          #  the hospital.
          #  OR
          #  Required on all claims involving inpatient medical visits.
          attr_reader :admission_date
          # @return [Date] 837p Loop2300 DTP\*096, CMS-1500 Box 18
          #  Required for inpatient claims when the patient was discharged from the facility
          #  and the discharge date is known.
          attr_reader :discharge_date
          # @return [Date] 837p Loop2300 DTP\*431, CMS-1500 Box 14
          #  Required for the initial medical service or visit performed in response to a
          #  medical emergency when the date is available and is different than the date of
          #  service.
          #  OR
          #  This date is the onset of acute symptoms for the current illness or condition.
          attr_reader :onset_of_current_illness_or_symptom_date
          # @return [Date] 837p Loop2300 DTP\*484, CMS-1500 Box 14
          #  Required when, in the judgment of the provider, the services on this claim are
          #  related to the patient's pregnancy.
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

          # @param patient_control_number [String] A patient control number (PCN) is a unique identifier assigned to a patient
          #  within a healthcare system or facility.
          #  It's used to track and manage a patient's medical records, treatments, and other
          #  healthcare-related information.
          # @param encounter_id [String]
          # @param claims [Array<CandidApiClient::Claims::Types::Claim>]
          # @param patient [CandidApiClient::Individual::Types::Patient] Contains the identification information of the individual receiving medical
          #  services.
          # @param guarantor [CandidApiClient::Guarantor::V1::Types::Guarantor] Personal and contact info for the guarantor of the patient responsibility.
          # @param billing_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider] The billing provider is the provider or business entity submitting the claim.
          #  Billing provider may be, but is not necessarily, the same person/NPI as the
          #  rendering provider. From a payer's perspective, this represents the person or
          #  entity being reimbursed. When a contract exists with the target payer, the
          #  billing provider should be the entity contracted with the payer. In some
          #  circumstances, this will be an individual provider. In that case, submit that
          #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
          #  contracting. In other cases, the billing entity will be a medical group. If so,
          #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
          # @param rendering_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider] The rendering provider is the practitioner -- physician, nurse practitioner,
          #  etc. -- performing the service.
          #  For telehealth services, the rendering provider performs the visit, asynchronous
          #  communication, or other service. The rendering provider address should generally
          #  be the same as the service facility address.
          # @param referring_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          # @param initial_referring_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          # @param supervising_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          # @param service_facility [CandidApiClient::ServiceFacility::Types::EncounterServiceFacility] Encounter Service facility is typically the location a medical service was
          #  rendered, such as a provider office or hospital. For telehealth, service
          #  facility can represent the provider's location when the service was delivered
          #  (e.g., home), or the location where an in-person visit would have taken place,
          #  whichever is easier to identify. If the provider is in-network, service facility
          #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
          #  for an in-network claim to be successfully adjudicated, the service facility
          #  address listed on claims must match what was provided to the payer during the
          #  credentialing process.
          # @param subscriber_primary [CandidApiClient::Individual::Types::Subscriber] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
          #  when the claim should be billed to insurance).
          #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
          #  claim should be billed to the patient).
          #  However, if you collect this for patients, even self-pay, we recommend including
          #  it when sending encounters to Candid.
          #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
          #  to define self-pay claims.
          # @param subscriber_secondary [CandidApiClient::Individual::Types::Subscriber] Contains details of the secondary insurance subscriber.
          # @param subscriber_tertiary [CandidApiClient::Individual::Types::Subscriber] Contains details of the tertiary insurance subscriber.
          # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
          # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
          # @param url [String] URL that links directly to the claim created in Candid.
          # @param diagnoses [Array<CandidApiClient::Diagnoses::Types::Diagnosis>] Ideally, this field should contain no more than 12 diagnoses. However, more
          #  diagnoses may be submitted at this time, and coders will later prioritize the 12
          #  that will be submitted to the payor.
          # @param clinical_notes [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategory>] Holds a collection of clinical observations made by healthcare providers during
          #  patient encounters.
          # @param billing_notes [Array<CandidApiClient::BillingNotes::V2::Types::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
          #  used in the billing process.
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          # @param place_of_service_code_as_submitted [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          # @param patient_histories [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
          # @param patient_payments [Array<CandidApiClient::PatientPayments::V3::Types::PatientPayment>]
          # @param tags [Array<CandidApiClient::Tags::Types::Tag>]
          # @param coding_attribution [CandidApiClient::Encounters::V4::Types::CodingAttributionType] The entity that performed the coding of medical services for the claim.
          # @param work_queue_id [String]
          # @param work_queue_membership_activated_at [DateTime]
          # @param owner_of_next_action [CandidApiClient::Encounters::V4::Types::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as
          #  defined by ownership of open Tasks.
          # @param submission_origin [CandidApiClient::Encounters::V4::Types::EncounterSubmissionOriginType] The party who originally submitted the Claim.
          #  For Claims originating in Candid, this will be
          #  EncounterSubmissionOriginType.CANDID.
          #  For Encounters created with an external_claim_submission object, this will be
          #  EncounterSubmissionOriginType.EXTERNAL.
          # @param schema_instances [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
          #  Multiple schema
          #  instances cannot be created for the same schema on an encounter.
          # @param referral_number [String] Refers to REF\*9F on the 837p. Value cannot be greater than 50 characters.
          # @param epsdt_referral [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
          #  837P form
          # @param claim_supplemental_information [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P form. No more than 10 entries are
          #  permitted.
          # @param last_submitted_at [DateTime] The date and time the encounter was last submitted to a payer.
          # @param created_at [DateTime] The date and time the encounter was created.
          # @param external_id [String] A client-specified unique ID to associate with this encounter;
          #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #  This field should not contain PHI.
          # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          #  Box 24a on the CMS-1500 claim form.
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
          #  Box 12 on the CMS-1500 claim form.
          # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
          #  not them. If false, patient may receive reimbursement.
          #  Box 13 on the CMS-1500 claim form.
          # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
          #  to be made to you, not them.
          #  Box 27 on the CMS-1500 claim form.
          # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
          #  Headaches").
          # @param existing_medications [Array<CandidApiClient::Encounters::V4::Types::Medication>]
          # @param vitals [CandidApiClient::Encounters::V4::Types::Vitals]
          # @param interventions [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
          # @param pay_to_address [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
          # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
          #  Asynchronous encounters occur when providers and patients communicate online
          #  using
          #  forms, instant messaging, or other pre-recorded digital mediums.
          #  Synchronous encounters occur in live, real-time settings where the patient
          #  interacts
          #  directly with the provider, such as over video or a phone call.
          # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include
          #  if the Encounter has not occurred yet or if there is no intention of ever
          #  billing the responsible_party.
          # @param additional_information [String] Defines additional information on the claim needed by the payer.
          #  Box 19 on the CMS-1500 claim form.
          # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
          #  Required when mandated by government law or regulation to obtain authorization
          #  for specific service(s) but, for the
          #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
          #  the service was performed without
          #  obtaining the authorization.
          # @param admission_date [Date] 837p Loop2300 DTP\*435, CMS-1500 Box 18
          #  Required on all ambulance claims when the patient was known to be admitted to
          #  the hospital.
          #  OR
          #  Required on all claims involving inpatient medical visits.
          # @param discharge_date [Date] 837p Loop2300 DTP\*096, CMS-1500 Box 18
          #  Required for inpatient claims when the patient was discharged from the facility
          #  and the discharge date is known.
          # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP\*431, CMS-1500 Box 14
          #  Required for the initial medical service or visit performed in response to a
          #  medical emergency when the date is available and is different than the date of
          #  service.
          #  OR
          #  This date is the onset of acute symptoms for the current illness or condition.
          # @param last_menstrual_period_date [Date] 837p Loop2300 DTP\*484, CMS-1500 Box 14
          #  Required when, in the judgment of the provider, the services on this claim are
          #  related to the patient's pregnancy.
          # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #  Code indicating the reason why a request was delayed
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::Encounter]
          def initialize(encounter_id:, claims:, patient:, billing_provider:, rendering_provider:, service_facility:,
                         responsible_party:, url:, diagnoses:, clinical_notes:, patient_histories:, patient_payments:, tags:, owner_of_next_action:, submission_origin:, schema_instances:, created_at:, external_id:, patient_authorized_release:, benefits_assigned_to_provider:, provider_accepts_assignment:, billable_status:, patient_control_number: OMIT, guarantor: OMIT, referring_provider: OMIT, initial_referring_provider: OMIT, supervising_provider: OMIT, subscriber_primary: OMIT, subscriber_secondary: OMIT, subscriber_tertiary: OMIT, prior_authorization_number: OMIT, billing_notes: OMIT, place_of_service_code: OMIT, place_of_service_code_as_submitted: OMIT, coding_attribution: OMIT, work_queue_id: OMIT, work_queue_membership_activated_at: OMIT, referral_number: OMIT, epsdt_referral: OMIT, claim_supplemental_information: OMIT, last_submitted_at: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, appointment_type: OMIT, existing_medications: OMIT, vitals: OMIT, interventions: OMIT, pay_to_address: OMIT, synchronicity: OMIT, additional_information: OMIT, service_authorization_exception_code: OMIT, admission_date: OMIT, discharge_date: OMIT, onset_of_current_illness_or_symptom_date: OMIT, last_menstrual_period_date: OMIT, delay_reason_code: OMIT, additional_properties: nil)
            @patient_control_number = patient_control_number if patient_control_number != OMIT
            @encounter_id = encounter_id
            @claims = claims
            @patient = patient
            @guarantor = guarantor if guarantor != OMIT
            @billing_provider = billing_provider
            @rendering_provider = rendering_provider
            @referring_provider = referring_provider if referring_provider != OMIT
            @initial_referring_provider = initial_referring_provider if initial_referring_provider != OMIT
            @supervising_provider = supervising_provider if supervising_provider != OMIT
            @service_facility = service_facility
            @subscriber_primary = subscriber_primary if subscriber_primary != OMIT
            @subscriber_secondary = subscriber_secondary if subscriber_secondary != OMIT
            @subscriber_tertiary = subscriber_tertiary if subscriber_tertiary != OMIT
            @prior_authorization_number = prior_authorization_number if prior_authorization_number != OMIT
            @responsible_party = responsible_party
            @url = url
            @diagnoses = diagnoses
            @clinical_notes = clinical_notes
            @billing_notes = billing_notes if billing_notes != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            if place_of_service_code_as_submitted != OMIT
              @place_of_service_code_as_submitted = place_of_service_code_as_submitted
            end
            @patient_histories = patient_histories
            @patient_payments = patient_payments
            @tags = tags
            @coding_attribution = coding_attribution if coding_attribution != OMIT
            @work_queue_id = work_queue_id if work_queue_id != OMIT
            if work_queue_membership_activated_at != OMIT
              @work_queue_membership_activated_at = work_queue_membership_activated_at
            end
            @owner_of_next_action = owner_of_next_action
            @submission_origin = submission_origin
            @schema_instances = schema_instances
            @referral_number = referral_number if referral_number != OMIT
            @epsdt_referral = epsdt_referral if epsdt_referral != OMIT
            @claim_supplemental_information = claim_supplemental_information if claim_supplemental_information != OMIT
            @last_submitted_at = last_submitted_at if last_submitted_at != OMIT
            @created_at = created_at
            @external_id = external_id
            @date_of_service = date_of_service if date_of_service != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @patient_authorized_release = patient_authorized_release
            @benefits_assigned_to_provider = benefits_assigned_to_provider
            @provider_accepts_assignment = provider_accepts_assignment
            @appointment_type = appointment_type if appointment_type != OMIT
            @existing_medications = existing_medications if existing_medications != OMIT
            @vitals = vitals if vitals != OMIT
            @interventions = interventions if interventions != OMIT
            @pay_to_address = pay_to_address if pay_to_address != OMIT
            @synchronicity = synchronicity if synchronicity != OMIT
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
              "patient_control_number": patient_control_number,
              "encounter_id": encounter_id,
              "claims": claims,
              "patient": patient,
              "guarantor": guarantor,
              "billing_provider": billing_provider,
              "rendering_provider": rendering_provider,
              "referring_provider": referring_provider,
              "initial_referring_provider": initial_referring_provider,
              "supervising_provider": supervising_provider,
              "service_facility": service_facility,
              "subscriber_primary": subscriber_primary,
              "subscriber_secondary": subscriber_secondary,
              "subscriber_tertiary": subscriber_tertiary,
              "prior_authorization_number": prior_authorization_number,
              "responsible_party": responsible_party,
              "url": url,
              "diagnoses": diagnoses,
              "clinical_notes": clinical_notes,
              "billing_notes": billing_notes,
              "place_of_service_code": place_of_service_code,
              "place_of_service_code_as_submitted": place_of_service_code_as_submitted,
              "patient_histories": patient_histories,
              "patient_payments": patient_payments,
              "tags": tags,
              "coding_attribution": coding_attribution,
              "work_queue_id": work_queue_id,
              "work_queue_membership_activated_at": work_queue_membership_activated_at,
              "owner_of_next_action": owner_of_next_action,
              "submission_origin": submission_origin,
              "schema_instances": schema_instances,
              "referral_number": referral_number,
              "epsdt_referral": epsdt_referral,
              "claim_supplemental_information": claim_supplemental_information,
              "last_submitted_at": last_submitted_at,
              "created_at": created_at,
              "external_id": external_id,
              "date_of_service": date_of_service,
              "end_date_of_service": end_date_of_service,
              "patient_authorized_release": patient_authorized_release,
              "benefits_assigned_to_provider": benefits_assigned_to_provider,
              "provider_accepts_assignment": provider_accepts_assignment,
              "appointment_type": appointment_type,
              "existing_medications": existing_medications,
              "vitals": vitals,
              "interventions": interventions,
              "pay_to_address": pay_to_address,
              "synchronicity": synchronicity,
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

          # Deserialize a JSON object to an instance of Encounter
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::Encounter]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            patient_control_number = struct["patient_control_number"]
            encounter_id = struct["encounter_id"]
            claims = parsed_json["claims"]&.map do |item|
              item = item.to_json
              CandidApiClient::Claims::Types::Claim.from_json(json_object: item)
            end
            if parsed_json["patient"].nil?
              patient = nil
            else
              patient = parsed_json["patient"].to_json
              patient = CandidApiClient::Individual::Types::Patient.from_json(json_object: patient)
            end
            if parsed_json["guarantor"].nil?
              guarantor = nil
            else
              guarantor = parsed_json["guarantor"].to_json
              guarantor = CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: guarantor)
            end
            if parsed_json["billing_provider"].nil?
              billing_provider = nil
            else
              billing_provider = parsed_json["billing_provider"].to_json
              billing_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: billing_provider)
            end
            if parsed_json["rendering_provider"].nil?
              rendering_provider = nil
            else
              rendering_provider = parsed_json["rendering_provider"].to_json
              rendering_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: rendering_provider)
            end
            if parsed_json["referring_provider"].nil?
              referring_provider = nil
            else
              referring_provider = parsed_json["referring_provider"].to_json
              referring_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: referring_provider)
            end
            if parsed_json["initial_referring_provider"].nil?
              initial_referring_provider = nil
            else
              initial_referring_provider = parsed_json["initial_referring_provider"].to_json
              initial_referring_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: initial_referring_provider)
            end
            if parsed_json["supervising_provider"].nil?
              supervising_provider = nil
            else
              supervising_provider = parsed_json["supervising_provider"].to_json
              supervising_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: supervising_provider)
            end
            if parsed_json["service_facility"].nil?
              service_facility = nil
            else
              service_facility = parsed_json["service_facility"].to_json
              service_facility = CandidApiClient::ServiceFacility::Types::EncounterServiceFacility.from_json(json_object: service_facility)
            end
            if parsed_json["subscriber_primary"].nil?
              subscriber_primary = nil
            else
              subscriber_primary = parsed_json["subscriber_primary"].to_json
              subscriber_primary = CandidApiClient::Individual::Types::Subscriber.from_json(json_object: subscriber_primary)
            end
            if parsed_json["subscriber_secondary"].nil?
              subscriber_secondary = nil
            else
              subscriber_secondary = parsed_json["subscriber_secondary"].to_json
              subscriber_secondary = CandidApiClient::Individual::Types::Subscriber.from_json(json_object: subscriber_secondary)
            end
            if parsed_json["subscriber_tertiary"].nil?
              subscriber_tertiary = nil
            else
              subscriber_tertiary = parsed_json["subscriber_tertiary"].to_json
              subscriber_tertiary = CandidApiClient::Individual::Types::Subscriber.from_json(json_object: subscriber_tertiary)
            end
            prior_authorization_number = struct["prior_authorization_number"]
            responsible_party = struct["responsible_party"]
            url = struct["url"]
            diagnoses = parsed_json["diagnoses"]&.map do |item|
              item = item.to_json
              CandidApiClient::Diagnoses::Types::Diagnosis.from_json(json_object: item)
            end
            clinical_notes = parsed_json["clinical_notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClinicalNoteCategory.from_json(json_object: item)
            end
            billing_notes = parsed_json["billing_notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: item)
            end
            place_of_service_code = struct["place_of_service_code"]
            place_of_service_code_as_submitted = struct["place_of_service_code_as_submitted"]
            patient_histories = parsed_json["patient_histories"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::PatientHistoryCategory.from_json(json_object: item)
            end
            patient_payments = parsed_json["patient_payments"]&.map do |item|
              item = item.to_json
              CandidApiClient::PatientPayments::V3::Types::PatientPayment.from_json(json_object: item)
            end
            tags = parsed_json["tags"]&.map do |item|
              item = item.to_json
              CandidApiClient::Tags::Types::Tag.from_json(json_object: item)
            end
            coding_attribution = struct["coding_attribution"]
            work_queue_id = struct["work_queue_id"]
            work_queue_membership_activated_at = unless parsed_json["work_queue_membership_activated_at"].nil?
                                                   DateTime.parse(parsed_json["work_queue_membership_activated_at"])
                                                 end
            owner_of_next_action = struct["owner_of_next_action"]
            submission_origin = struct["submission_origin"]
            schema_instances = parsed_json["schema_instances"]&.map do |item|
              item = item.to_json
              CandidApiClient::CustomSchemas::V1::Types::SchemaInstance.from_json(json_object: item)
            end
            referral_number = struct["referral_number"]
            if parsed_json["epsdt_referral"].nil?
              epsdt_referral = nil
            else
              epsdt_referral = parsed_json["epsdt_referral"].to_json
              epsdt_referral = CandidApiClient::Encounters::V4::Types::EpsdtReferral.from_json(json_object: epsdt_referral)
            end
            claim_supplemental_information = parsed_json["claim_supplemental_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation.from_json(json_object: item)
            end
            last_submitted_at = unless parsed_json["last_submitted_at"].nil?
                                  DateTime.parse(parsed_json["last_submitted_at"])
                                end
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
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
            if parsed_json["vitals"].nil?
              vitals = nil
            else
              vitals = parsed_json["vitals"].to_json
              vitals = CandidApiClient::Encounters::V4::Types::Vitals.from_json(json_object: vitals)
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
              patient_control_number: patient_control_number,
              encounter_id: encounter_id,
              claims: claims,
              patient: patient,
              guarantor: guarantor,
              billing_provider: billing_provider,
              rendering_provider: rendering_provider,
              referring_provider: referring_provider,
              initial_referring_provider: initial_referring_provider,
              supervising_provider: supervising_provider,
              service_facility: service_facility,
              subscriber_primary: subscriber_primary,
              subscriber_secondary: subscriber_secondary,
              subscriber_tertiary: subscriber_tertiary,
              prior_authorization_number: prior_authorization_number,
              responsible_party: responsible_party,
              url: url,
              diagnoses: diagnoses,
              clinical_notes: clinical_notes,
              billing_notes: billing_notes,
              place_of_service_code: place_of_service_code,
              place_of_service_code_as_submitted: place_of_service_code_as_submitted,
              patient_histories: patient_histories,
              patient_payments: patient_payments,
              tags: tags,
              coding_attribution: coding_attribution,
              work_queue_id: work_queue_id,
              work_queue_membership_activated_at: work_queue_membership_activated_at,
              owner_of_next_action: owner_of_next_action,
              submission_origin: submission_origin,
              schema_instances: schema_instances,
              referral_number: referral_number,
              epsdt_referral: epsdt_referral,
              claim_supplemental_information: claim_supplemental_information,
              last_submitted_at: last_submitted_at,
              created_at: created_at,
              external_id: external_id,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              patient_authorized_release: patient_authorized_release,
              benefits_assigned_to_provider: benefits_assigned_to_provider,
              provider_accepts_assignment: provider_accepts_assignment,
              appointment_type: appointment_type,
              existing_medications: existing_medications,
              vitals: vitals,
              interventions: interventions,
              pay_to_address: pay_to_address,
              synchronicity: synchronicity,
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

          # Serialize an instance of Encounter to a JSON object
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
            obj.patient_control_number&.is_a?(String) != false || raise("Passed value for field obj.patient_control_number is not the expected type, validation failed.")
            obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.claims.is_a?(Array) != false || raise("Passed value for field obj.claims is not the expected type, validation failed.")
            CandidApiClient::Individual::Types::Patient.validate_raw(obj: obj.patient)
            obj.guarantor.nil? || CandidApiClient::Guarantor::V1::Types::Guarantor.validate_raw(obj: obj.guarantor)
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.billing_provider)
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.rendering_provider)
            obj.referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.referring_provider)
            obj.initial_referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.initial_referring_provider)
            obj.supervising_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.supervising_provider)
            CandidApiClient::ServiceFacility::Types::EncounterServiceFacility.validate_raw(obj: obj.service_facility)
            obj.subscriber_primary.nil? || CandidApiClient::Individual::Types::Subscriber.validate_raw(obj: obj.subscriber_primary)
            obj.subscriber_secondary.nil? || CandidApiClient::Individual::Types::Subscriber.validate_raw(obj: obj.subscriber_secondary)
            obj.subscriber_tertiary.nil? || CandidApiClient::Individual::Types::Subscriber.validate_raw(obj: obj.subscriber_tertiary)
            obj.prior_authorization_number&.is_a?(String) != false || raise("Passed value for field obj.prior_authorization_number is not the expected type, validation failed.")
            obj.responsible_party.is_a?(CandidApiClient::Encounters::V4::Types::ResponsiblePartyType) != false || raise("Passed value for field obj.responsible_party is not the expected type, validation failed.")
            obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
            obj.diagnoses.is_a?(Array) != false || raise("Passed value for field obj.diagnoses is not the expected type, validation failed.")
            obj.clinical_notes.is_a?(Array) != false || raise("Passed value for field obj.clinical_notes is not the expected type, validation failed.")
            obj.billing_notes&.is_a?(Array) != false || raise("Passed value for field obj.billing_notes is not the expected type, validation failed.")
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.place_of_service_code_as_submitted&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code_as_submitted is not the expected type, validation failed.")
            obj.patient_histories.is_a?(Array) != false || raise("Passed value for field obj.patient_histories is not the expected type, validation failed.")
            obj.patient_payments.is_a?(Array) != false || raise("Passed value for field obj.patient_payments is not the expected type, validation failed.")
            obj.tags.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
            obj.coding_attribution&.is_a?(CandidApiClient::Encounters::V4::Types::CodingAttributionType) != false || raise("Passed value for field obj.coding_attribution is not the expected type, validation failed.")
            obj.work_queue_id&.is_a?(String) != false || raise("Passed value for field obj.work_queue_id is not the expected type, validation failed.")
            obj.work_queue_membership_activated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.work_queue_membership_activated_at is not the expected type, validation failed.")
            obj.owner_of_next_action.is_a?(CandidApiClient::Encounters::V4::Types::EncounterOwnerOfNextActionType) != false || raise("Passed value for field obj.owner_of_next_action is not the expected type, validation failed.")
            obj.submission_origin.is_a?(CandidApiClient::Encounters::V4::Types::EncounterSubmissionOriginType) != false || raise("Passed value for field obj.submission_origin is not the expected type, validation failed.")
            obj.schema_instances.is_a?(Array) != false || raise("Passed value for field obj.schema_instances is not the expected type, validation failed.")
            obj.referral_number&.is_a?(String) != false || raise("Passed value for field obj.referral_number is not the expected type, validation failed.")
            obj.epsdt_referral.nil? || CandidApiClient::Encounters::V4::Types::EpsdtReferral.validate_raw(obj: obj.epsdt_referral)
            obj.claim_supplemental_information&.is_a?(Array) != false || raise("Passed value for field obj.claim_supplemental_information is not the expected type, validation failed.")
            obj.last_submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_submitted_at is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.patient_authorized_release.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
            obj.benefits_assigned_to_provider.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
            obj.provider_accepts_assignment.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
            obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
            obj.existing_medications&.is_a?(Array) != false || raise("Passed value for field obj.existing_medications is not the expected type, validation failed.")
            obj.vitals.nil? || CandidApiClient::Encounters::V4::Types::Vitals.validate_raw(obj: obj.vitals)
            obj.interventions&.is_a?(Array) != false || raise("Passed value for field obj.interventions is not the expected type, validation failed.")
            obj.pay_to_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.pay_to_address)
            obj.synchronicity&.is_a?(CandidApiClient::Encounters::V4::Types::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
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
end
