# frozen_string_literal: true

require_relative "../../../commons/types/encounter_id"
require_relative "../../../claims/types/claim"
require_relative "../../../individual/types/patient"
require_relative "../../../guarantor/v_1/types/guarantor"
require_relative "../../../encounter_providers/v_2/types/encounter_provider"
require_relative "../../../service_facility/types/encounter_service_facility"
require_relative "../../../individual/types/subscriber"
require_relative "../../../commons/types/link_url"
require_relative "../../../diagnoses/types/diagnosis"
require_relative "clinical_note_category"
require_relative "../../../billing_notes/v_2/types/billing_note"
require_relative "../../../commons/types/facility_type_code"
require_relative "patient_history_category"
require_relative "../../../patient_payments/v_3/types/patient_payment"
require_relative "../../../tags/types/tag"
require_relative "coding_attribution_type"
require_relative "../../../commons/types/work_queue_id"
require "date"
require_relative "encounter_owner_of_next_action_type"
require_relative "encounter_submission_origin_type"
require_relative "../../../commons/types/encounter_external_id"
require_relative "../../../commons/types/date"
require_relative "prior_authorization_number"
require_relative "medication"
require_relative "vitals"
require_relative "intervention"
require_relative "../../../commons/types/street_address_long_zip"
require_relative "synchronicity_type"
require_relative "billable_status_type"
require_relative "responsible_party_type"
require_relative "service_authorization_exception_code"
require_relative "../../../commons/types/delay_reason_code"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class Encounter
        attr_reader :encounter_id, :claims, :patient, :guarantor, :billing_provider, :rendering_provider,
                    :referring_provider, :service_facility, :subscriber_primary, :subscriber_secondary, :url, :diagnoses, :clinical_notes, :billing_notes, :place_of_service_code, :place_of_service_code_as_submitted, :patient_histories, :patient_payments, :tags, :coding_attribution, :work_queue_id, :work_queue_membership_activated_at, :owner_of_next_action, :submission_origin, :external_id, :date_of_service, :end_date_of_service, :prior_authorization_number, :patient_authorized_release, :benefits_assigned_to_provider, :provider_accepts_assignment, :appointment_type, :existing_medications, :vitals, :interventions, :pay_to_address, :synchronicity, :billable_status, :responsible_party, :additional_information, :service_authorization_exception_code, :admission_date, :discharge_date, :onset_of_current_illness_or_symptom_date, :last_menstrual_period_date, :delay_reason_code, :additional_properties

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param claims [Array<Claims::Claim>]
        # @param patient [Individual::Patient] Contains the identification information of the individual receiving medical services.
        # @param guarantor [Guarantor::V1::Guarantor] Personal and contact info for the guarantor of the patient responsibility.
        # @param billing_provider [EncounterProviders::V2::EncounterProvider] The billing provider is the provider or business entity submitting the claim. Billing provider may be, but is not necessarily, the same person/NPI as the rendering provider. From a payer's perspective, this represents the person or entity being reimbursed. When a contract exists with the target payer, the billing provider should be the entity contracted with the payer. In some circumstances, this will be an individual provider. In that case, submit that provider's NPI and the tax ID (TIN) that the provider gave to the payer during contracting. In other cases, the billing entity will be a medical group. If so, submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
        # @param rendering_provider [EncounterProviders::V2::EncounterProvider] The rendering provider is the practitioner -- physician, nurse practitioner, etc. -- performing the service.
        #   For telehealth services, the rendering provider performs the visit, asynchronous communication, or other service. The rendering provider address should generally be the same as the service facility address.
        # @param referring_provider [EncounterProviders::V2::EncounterProvider]
        # @param service_facility [ServiceFacility::EncounterServiceFacility] Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital. For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home), or the location where an in-person visit would have taken place, whichever is easier to identify. If the provider is in-network, service facility may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims must match what was provided to the payer during the credentialing process.
        # @param subscriber_primary [Individual::Subscriber] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e. when the claim should be billed to insurance).
        #   These are not required fields when responsible_party is SELF_PAY (i.e. when the claim should be billed to the patient).
        #   However, if you collect this for patients, even self-pay, we recommend including it when sending encounters to Candid.
        #   Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party to define self-pay claims.
        # @param subscriber_secondary [Individual::Subscriber] Contains details of the secondary insurance subscriber.
        # @param url [Commons::LINK_URL] URL that links directly to the claim created in Candid.
        # @param diagnoses [Array<Diagnoses::Diagnosis>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses may be submitted at this time, and coders will later prioritize the 12 that will be submitted to the payor.
        # @param clinical_notes [Array<Encounters::V4::ClinicalNoteCategory>] Holds a collection of clinical observations made by healthcare providers during patient encounters.
        # @param billing_notes [Array<BillingNotes::V2::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
        #   used in the billing process.
        # @param place_of_service_code [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param place_of_service_code_as_submitted [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param patient_histories [Array<Encounters::V4::PatientHistoryCategory>]
        # @param patient_payments [Array<PatientPayments::V3::PatientPayment>]
        # @param tags [Array<Tags::Tag>]
        # @param coding_attribution [Encounters::V4::CodingAttributionType] The entity that performed the coding of medical services for the claim.
        # @param work_queue_id [Commons::WORK_QUEUE_ID]
        # @param work_queue_membership_activated_at [DateTime]
        # @param owner_of_next_action [Encounters::V4::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as defined by ownership of open Tasks.
        # @param submission_origin [Encounters::V4::EncounterSubmissionOriginType] The party who originally submitted the Claim.
        #   For Claims originating in Candid, this will be EncounterSubmissionOriginType.CANDID.
        #   For Encounters created with an external_claim_submission object, this will be EncounterSubmissionOriginType.EXTERNAL.
        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
        #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #   This field should not contain PHI.
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #   This date must be the local date in the timezone where the service occurred.
        #   Box 24a on the CMS-1500 claim form.
        #   If service occurred over a range of dates, this should be the start date.
        # @param end_date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #   This date must be the local date in the timezone where the service occurred.
        #   If omitted, the Encounter is assumed to be for a single day.
        #   Must not be temporally before the date_of_service field.
        # @param prior_authorization_number [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #   for billing purpose.
        #   Box 12 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #   not them. If false, patient may receive reimbursement.
        #   Box 13 on the CMS-1500 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #   to be made to you, not them.
        #   Box 27 on the CMS-1500 claim form.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
        # @param existing_medications [Array<Encounters::V4::Medication>]
        # @param vitals [Encounters::V4::Vitals]
        # @param interventions [Array<Encounters::V4::Intervention>]
        # @param pay_to_address [Commons::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
        # @param synchronicity [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #   Asynchronous encounters occur when providers and patients communicate online using
        #   forms, instant messaging, or other pre-recorded digital mediums.
        #   Synchronous encounters occur in live, real-time settings where the patient interacts
        #   directly with the provider, such as over video or a phone call.
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #   Examples for when this should be set to NOT_BILLABLE include
        #   if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #   Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
        #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
        #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
        #   obtaining the authorization.
        # @param admission_date [Commons::DATE] 837p Loop2300 DTP\*435, CMS-1500 Box 18
        #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
        #   OR
        #   Required on all claims involving inpatient medical visits.
        # @param discharge_date [Commons::DATE] 837p Loop2300 DTP\*096, CMS-1500 Box 18
        #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Commons::DATE] 837p Loop2300 DTP\*431, CMS-1500 Box 14
        #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
        #   OR
        #   This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Commons::DATE] 837p Loop2300 DTP\*484, CMS-1500 Box 14
        #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
        # @param delay_reason_code [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #   Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::Encounter]
        def initialize(encounter_id:, claims:, patient:, billing_provider:, rendering_provider:, service_facility:, url:, diagnoses:, clinical_notes:, patient_histories:, patient_payments:, tags:, owner_of_next_action:, submission_origin:, external_id:, date_of_service:, patient_authorized_release:, benefits_assigned_to_provider:, provider_accepts_assignment:, billable_status:, responsible_party:, guarantor: nil,
                       referring_provider: nil, subscriber_primary: nil, subscriber_secondary: nil, billing_notes: nil, place_of_service_code: nil, place_of_service_code_as_submitted: nil, coding_attribution: nil, work_queue_id: nil, work_queue_membership_activated_at: nil, end_date_of_service: nil, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil)
          # @type [Commons::ENCOUNTER_ID]
          @encounter_id = encounter_id
          # @type [Array<Claims::Claim>]
          @claims = claims
          # @type [Individual::Patient] Contains the identification information of the individual receiving medical services.
          @patient = patient
          # @type [Guarantor::V1::Guarantor] Personal and contact info for the guarantor of the patient responsibility.
          @guarantor = guarantor
          # @type [EncounterProviders::V2::EncounterProvider] The billing provider is the provider or business entity submitting the claim. Billing provider may be, but is not necessarily, the same person/NPI as the rendering provider. From a payer's perspective, this represents the person or entity being reimbursed. When a contract exists with the target payer, the billing provider should be the entity contracted with the payer. In some circumstances, this will be an individual provider. In that case, submit that provider's NPI and the tax ID (TIN) that the provider gave to the payer during contracting. In other cases, the billing entity will be a medical group. If so, submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
          @billing_provider = billing_provider
          # @type [EncounterProviders::V2::EncounterProvider] The rendering provider is the practitioner -- physician, nurse practitioner, etc. -- performing the service.
          #   For telehealth services, the rendering provider performs the visit, asynchronous communication, or other service. The rendering provider address should generally be the same as the service facility address.
          @rendering_provider = rendering_provider
          # @type [EncounterProviders::V2::EncounterProvider]
          @referring_provider = referring_provider
          # @type [ServiceFacility::EncounterServiceFacility] Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital. For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home), or the location where an in-person visit would have taken place, whichever is easier to identify. If the provider is in-network, service facility may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims must match what was provided to the payer during the credentialing process.
          @service_facility = service_facility
          # @type [Individual::Subscriber] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e. when the claim should be billed to insurance).
          #   These are not required fields when responsible_party is SELF_PAY (i.e. when the claim should be billed to the patient).
          #   However, if you collect this for patients, even self-pay, we recommend including it when sending encounters to Candid.
          #   Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party to define self-pay claims.
          @subscriber_primary = subscriber_primary
          # @type [Individual::Subscriber] Contains details of the secondary insurance subscriber.
          @subscriber_secondary = subscriber_secondary
          # @type [Commons::LINK_URL] URL that links directly to the claim created in Candid.
          @url = url
          # @type [Array<Diagnoses::Diagnosis>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses may be submitted at this time, and coders will later prioritize the 12 that will be submitted to the payor.
          @diagnoses = diagnoses
          # @type [Array<Encounters::V4::ClinicalNoteCategory>] Holds a collection of clinical observations made by healthcare providers during patient encounters.
          @clinical_notes = clinical_notes
          # @type [Array<BillingNotes::V2::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
          #   used in the billing process.
          @billing_notes = billing_notes
          # @type [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          @place_of_service_code = place_of_service_code
          # @type [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          @place_of_service_code_as_submitted = place_of_service_code_as_submitted
          # @type [Array<Encounters::V4::PatientHistoryCategory>]
          @patient_histories = patient_histories
          # @type [Array<PatientPayments::V3::PatientPayment>]
          @patient_payments = patient_payments
          # @type [Array<Tags::Tag>]
          @tags = tags
          # @type [Encounters::V4::CodingAttributionType] The entity that performed the coding of medical services for the claim.
          @coding_attribution = coding_attribution
          # @type [Commons::WORK_QUEUE_ID]
          @work_queue_id = work_queue_id
          # @type [DateTime]
          @work_queue_membership_activated_at = work_queue_membership_activated_at
          # @type [Encounters::V4::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as defined by ownership of open Tasks.
          @owner_of_next_action = owner_of_next_action
          # @type [Encounters::V4::EncounterSubmissionOriginType] The party who originally submitted the Claim.
          #   For Claims originating in Candid, this will be EncounterSubmissionOriginType.CANDID.
          #   For Encounters created with an external_claim_submission object, this will be EncounterSubmissionOriginType.EXTERNAL.
          @submission_origin = submission_origin
          # @type [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
          #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #   This field should not contain PHI.
          @external_id = external_id
          # @type [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #   This date must be the local date in the timezone where the service occurred.
          #   Box 24a on the CMS-1500 claim form.
          #   If service occurred over a range of dates, this should be the start date.
          @date_of_service = date_of_service
          # @type [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
          #   This date must be the local date in the timezone where the service occurred.
          #   If omitted, the Encounter is assumed to be for a single day.
          #   Must not be temporally before the date_of_service field.
          @end_date_of_service = end_date_of_service
          # @type [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
          @prior_authorization_number = prior_authorization_number
          # @type [Boolean] Whether this patient has authorized the release of medical information
          #   for billing purpose.
          #   Box 12 on the CMS-1500 claim form.
          @patient_authorized_release = patient_authorized_release
          # @type [Boolean] Whether this patient has authorized insurance payments to be made to you,
          #   not them. If false, patient may receive reimbursement.
          #   Box 13 on the CMS-1500 claim form.
          @benefits_assigned_to_provider = benefits_assigned_to_provider
          # @type [Boolean] Whether you have accepted the patient's authorization for insurance payments
          #   to be made to you, not them.
          #   Box 27 on the CMS-1500 claim form.
          @provider_accepts_assignment = provider_accepts_assignment
          # @type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
          @appointment_type = appointment_type
          # @type [Array<Encounters::V4::Medication>]
          @existing_medications = existing_medications
          # @type [Encounters::V4::Vitals]
          @vitals = vitals
          # @type [Array<Encounters::V4::Intervention>]
          @interventions = interventions
          # @type [Commons::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
          @pay_to_address = pay_to_address
          # @type [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
          #   Asynchronous encounters occur when providers and patients communicate online using
          #   forms, instant messaging, or other pre-recorded digital mediums.
          #   Synchronous encounters occur in live, real-time settings where the patient interacts
          #   directly with the provider, such as over video or a phone call.
          @synchronicity = synchronicity
          # @type [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #   Examples for when this should be set to NOT_BILLABLE include
          #   if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
          @billable_status = billable_status
          # @type [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
          @responsible_party = responsible_party
          # @type [String] Defines additional information on the claim needed by the payer.
          #   Box 19 on the CMS-1500 claim form.
          @additional_information = additional_information
          # @type [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
          #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
          #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
          #   obtaining the authorization.
          @service_authorization_exception_code = service_authorization_exception_code
          # @type [Commons::DATE] 837p Loop2300 DTP\*435, CMS-1500 Box 18
          #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
          #   OR
          #   Required on all claims involving inpatient medical visits.
          @admission_date = admission_date
          # @type [Commons::DATE] 837p Loop2300 DTP\*096, CMS-1500 Box 18
          #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
          @discharge_date = discharge_date
          # @type [Commons::DATE] 837p Loop2300 DTP\*431, CMS-1500 Box 14
          #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
          #   OR
          #   This date is the onset of acute symptoms for the current illness or condition.
          @onset_of_current_illness_or_symptom_date = onset_of_current_illness_or_symptom_date
          # @type [Commons::DATE] 837p Loop2300 DTP\*484, CMS-1500 Box 14
          #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
          @last_menstrual_period_date = last_menstrual_period_date
          # @type [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #   Code indicating the reason why a request was delayed
          @delay_reason_code = delay_reason_code
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Encounter
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::Encounter]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          encounter_id = struct.encounter_id
          claims = parsed_json["claims"]&.map do |v|
            v = v.to_json
            Claims::Claim.from_json(json_object: v)
          end
          if parsed_json["patient"].nil?
            patient = nil
          else
            patient = parsed_json["patient"].to_json
            patient = Individual::Patient.from_json(json_object: patient)
          end
          if parsed_json["guarantor"].nil?
            guarantor = nil
          else
            guarantor = parsed_json["guarantor"].to_json
            guarantor = Guarantor::V1::Guarantor.from_json(json_object: guarantor)
          end
          if parsed_json["billing_provider"].nil?
            billing_provider = nil
          else
            billing_provider = parsed_json["billing_provider"].to_json
            billing_provider = EncounterProviders::V2::EncounterProvider.from_json(json_object: billing_provider)
          end
          if parsed_json["rendering_provider"].nil?
            rendering_provider = nil
          else
            rendering_provider = parsed_json["rendering_provider"].to_json
            rendering_provider = EncounterProviders::V2::EncounterProvider.from_json(json_object: rendering_provider)
          end
          if parsed_json["referring_provider"].nil?
            referring_provider = nil
          else
            referring_provider = parsed_json["referring_provider"].to_json
            referring_provider = EncounterProviders::V2::EncounterProvider.from_json(json_object: referring_provider)
          end
          if parsed_json["service_facility"].nil?
            service_facility = nil
          else
            service_facility = parsed_json["service_facility"].to_json
            service_facility = ServiceFacility::EncounterServiceFacility.from_json(json_object: service_facility)
          end
          if parsed_json["subscriber_primary"].nil?
            subscriber_primary = nil
          else
            subscriber_primary = parsed_json["subscriber_primary"].to_json
            subscriber_primary = Individual::Subscriber.from_json(json_object: subscriber_primary)
          end
          if parsed_json["subscriber_secondary"].nil?
            subscriber_secondary = nil
          else
            subscriber_secondary = parsed_json["subscriber_secondary"].to_json
            subscriber_secondary = Individual::Subscriber.from_json(json_object: subscriber_secondary)
          end
          url = struct.url
          diagnoses = parsed_json["diagnoses"]&.map do |v|
            v = v.to_json
            Diagnoses::Diagnosis.from_json(json_object: v)
          end
          clinical_notes = parsed_json["clinical_notes"]&.map do |v|
            v = v.to_json
            Encounters::V4::ClinicalNoteCategory.from_json(json_object: v)
          end
          billing_notes = parsed_json["billing_notes"]&.map do |v|
            v = v.to_json
            BillingNotes::V2::BillingNote.from_json(json_object: v)
          end
          place_of_service_code = struct.place_of_service_code
          place_of_service_code_as_submitted = struct.place_of_service_code_as_submitted
          patient_histories = parsed_json["patient_histories"]&.map do |v|
            v = v.to_json
            Encounters::V4::PatientHistoryCategory.from_json(json_object: v)
          end
          patient_payments = parsed_json["patient_payments"]&.map do |v|
            v = v.to_json
            PatientPayments::V3::PatientPayment.from_json(json_object: v)
          end
          tags = parsed_json["tags"]&.map do |v|
            v = v.to_json
            Tags::Tag.from_json(json_object: v)
          end
          coding_attribution = struct.coding_attribution
          work_queue_id = struct.work_queue_id
          work_queue_membership_activated_at = unless parsed_json["work_queue_membership_activated_at"].nil?
                                                 DateTime.parse(parsed_json["work_queue_membership_activated_at"])
                                               end
          owner_of_next_action = struct.owner_of_next_action
          submission_origin = struct.submission_origin
          external_id = struct.external_id
          date_of_service = struct.date_of_service
          end_date_of_service = struct.end_date_of_service
          prior_authorization_number = struct.prior_authorization_number
          patient_authorized_release = struct.patient_authorized_release
          benefits_assigned_to_provider = struct.benefits_assigned_to_provider
          provider_accepts_assignment = struct.provider_accepts_assignment
          appointment_type = struct.appointment_type
          existing_medications = parsed_json["existing_medications"]&.map do |v|
            v = v.to_json
            Encounters::V4::Medication.from_json(json_object: v)
          end
          if parsed_json["vitals"].nil?
            vitals = nil
          else
            vitals = parsed_json["vitals"].to_json
            vitals = Encounters::V4::Vitals.from_json(json_object: vitals)
          end
          interventions = parsed_json["interventions"]&.map do |v|
            v = v.to_json
            Encounters::V4::Intervention.from_json(json_object: v)
          end
          if parsed_json["pay_to_address"].nil?
            pay_to_address = nil
          else
            pay_to_address = parsed_json["pay_to_address"].to_json
            pay_to_address = Commons::StreetAddressLongZip.from_json(json_object: pay_to_address)
          end
          synchronicity = struct.synchronicity
          billable_status = struct.billable_status
          responsible_party = struct.responsible_party
          additional_information = struct.additional_information
          service_authorization_exception_code = struct.service_authorization_exception_code
          admission_date = struct.admission_date
          discharge_date = struct.discharge_date
          onset_of_current_illness_or_symptom_date = struct.onset_of_current_illness_or_symptom_date
          last_menstrual_period_date = struct.last_menstrual_period_date
          delay_reason_code = struct.delay_reason_code
          new(encounter_id: encounter_id, claims: claims, patient: patient, guarantor: guarantor,
              billing_provider: billing_provider, rendering_provider: rendering_provider, referring_provider: referring_provider, service_facility: service_facility, subscriber_primary: subscriber_primary, subscriber_secondary: subscriber_secondary, url: url, diagnoses: diagnoses, clinical_notes: clinical_notes, billing_notes: billing_notes, place_of_service_code: place_of_service_code, place_of_service_code_as_submitted: place_of_service_code_as_submitted, patient_histories: patient_histories, patient_payments: patient_payments, tags: tags, coding_attribution: coding_attribution, work_queue_id: work_queue_id, work_queue_membership_activated_at: work_queue_membership_activated_at, owner_of_next_action: owner_of_next_action, submission_origin: submission_origin, external_id: external_id, date_of_service: date_of_service, end_date_of_service: end_date_of_service, prior_authorization_number: prior_authorization_number, patient_authorized_release: patient_authorized_release, benefits_assigned_to_provider: benefits_assigned_to_provider, provider_accepts_assignment: provider_accepts_assignment, appointment_type: appointment_type, existing_medications: existing_medications, vitals: vitals, interventions: interventions, pay_to_address: pay_to_address, synchronicity: synchronicity, billable_status: billable_status, responsible_party: responsible_party, additional_information: additional_information, service_authorization_exception_code: service_authorization_exception_code, admission_date: admission_date, discharge_date: discharge_date, onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date, last_menstrual_period_date: last_menstrual_period_date, delay_reason_code: delay_reason_code, additional_properties: struct)
        end

        # Serialize an instance of Encounter to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "encounter_id": @encounter_id,
            "claims": @claims,
            "patient": @patient,
            "guarantor": @guarantor,
            "billing_provider": @billing_provider,
            "rendering_provider": @rendering_provider,
            "referring_provider": @referring_provider,
            "service_facility": @service_facility,
            "subscriber_primary": @subscriber_primary,
            "subscriber_secondary": @subscriber_secondary,
            "url": @url,
            "diagnoses": @diagnoses,
            "clinical_notes": @clinical_notes,
            "billing_notes": @billing_notes,
            "place_of_service_code": @place_of_service_code,
            "place_of_service_code_as_submitted": @place_of_service_code_as_submitted,
            "patient_histories": @patient_histories,
            "patient_payments": @patient_payments,
            "tags": @tags,
            "coding_attribution": @coding_attribution,
            "work_queue_id": @work_queue_id,
            "work_queue_membership_activated_at": @work_queue_membership_activated_at,
            "owner_of_next_action": @owner_of_next_action,
            "submission_origin": @submission_origin,
            "external_id": @external_id,
            "date_of_service": @date_of_service,
            "end_date_of_service": @end_date_of_service,
            "prior_authorization_number": @prior_authorization_number,
            "patient_authorized_release": @patient_authorized_release,
            "benefits_assigned_to_provider": @benefits_assigned_to_provider,
            "provider_accepts_assignment": @provider_accepts_assignment,
            "appointment_type": @appointment_type,
            "existing_medications": @existing_medications,
            "vitals": @vitals,
            "interventions": @interventions,
            "pay_to_address": @pay_to_address,
            "synchronicity": @synchronicity,
            "billable_status": @billable_status,
            "responsible_party": @responsible_party,
            "additional_information": @additional_information,
            "service_authorization_exception_code": @service_authorization_exception_code,
            "admission_date": @admission_date,
            "discharge_date": @discharge_date,
            "onset_of_current_illness_or_symptom_date": @onset_of_current_illness_or_symptom_date,
            "last_menstrual_period_date": @last_menstrual_period_date,
            "delay_reason_code": @delay_reason_code
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.claims.is_a?(Array) != false || raise("Passed value for field obj.claims is not the expected type, validation failed.")
          Individual::Patient.validate_raw(obj: obj.patient)
          obj.guarantor.nil? || Guarantor::V1::Guarantor.validate_raw(obj: obj.guarantor)
          EncounterProviders::V2::EncounterProvider.validate_raw(obj: obj.billing_provider)
          EncounterProviders::V2::EncounterProvider.validate_raw(obj: obj.rendering_provider)
          obj.referring_provider.nil? || EncounterProviders::V2::EncounterProvider.validate_raw(obj: obj.referring_provider)
          ServiceFacility::EncounterServiceFacility.validate_raw(obj: obj.service_facility)
          obj.subscriber_primary.nil? || Individual::Subscriber.validate_raw(obj: obj.subscriber_primary)
          obj.subscriber_secondary.nil? || Individual::Subscriber.validate_raw(obj: obj.subscriber_secondary)
          obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
          obj.diagnoses.is_a?(Array) != false || raise("Passed value for field obj.diagnoses is not the expected type, validation failed.")
          obj.clinical_notes.is_a?(Array) != false || raise("Passed value for field obj.clinical_notes is not the expected type, validation failed.")
          obj.billing_notes&.is_a?(Array) != false || raise("Passed value for field obj.billing_notes is not the expected type, validation failed.")
          obj.place_of_service_code&.is_a?(Commons::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
          obj.place_of_service_code_as_submitted&.is_a?(Commons::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code_as_submitted is not the expected type, validation failed.")
          obj.patient_histories.is_a?(Array) != false || raise("Passed value for field obj.patient_histories is not the expected type, validation failed.")
          obj.patient_payments.is_a?(Array) != false || raise("Passed value for field obj.patient_payments is not the expected type, validation failed.")
          obj.tags.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
          obj.coding_attribution&.is_a?(Encounters::V4::CodingAttributionType) != false || raise("Passed value for field obj.coding_attribution is not the expected type, validation failed.")
          obj.work_queue_id&.is_a?(String) != false || raise("Passed value for field obj.work_queue_id is not the expected type, validation failed.")
          obj.work_queue_membership_activated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.work_queue_membership_activated_at is not the expected type, validation failed.")
          obj.owner_of_next_action.is_a?(Encounters::V4::EncounterOwnerOfNextActionType) != false || raise("Passed value for field obj.owner_of_next_action is not the expected type, validation failed.")
          obj.submission_origin.is_a?(Encounters::V4::EncounterSubmissionOriginType) != false || raise("Passed value for field obj.submission_origin is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_service.is_a?(String) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.end_date_of_service&.is_a?(String) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
          obj.prior_authorization_number&.is_a?(String) != false || raise("Passed value for field obj.prior_authorization_number is not the expected type, validation failed.")
          obj.patient_authorized_release.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
          obj.benefits_assigned_to_provider.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
          obj.provider_accepts_assignment.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
          obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
          obj.existing_medications&.is_a?(Array) != false || raise("Passed value for field obj.existing_medications is not the expected type, validation failed.")
          obj.vitals.nil? || Encounters::V4::Vitals.validate_raw(obj: obj.vitals)
          obj.interventions&.is_a?(Array) != false || raise("Passed value for field obj.interventions is not the expected type, validation failed.")
          obj.pay_to_address.nil? || Commons::StreetAddressLongZip.validate_raw(obj: obj.pay_to_address)
          obj.synchronicity&.is_a?(Encounters::V4::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
          obj.billable_status.is_a?(Encounters::V4::BillableStatusType) != false || raise("Passed value for field obj.billable_status is not the expected type, validation failed.")
          obj.responsible_party.is_a?(Encounters::V4::ResponsiblePartyType) != false || raise("Passed value for field obj.responsible_party is not the expected type, validation failed.")
          obj.additional_information&.is_a?(String) != false || raise("Passed value for field obj.additional_information is not the expected type, validation failed.")
          obj.service_authorization_exception_code&.is_a?(Encounters::V4::ServiceAuthorizationExceptionCode) != false || raise("Passed value for field obj.service_authorization_exception_code is not the expected type, validation failed.")
          obj.admission_date&.is_a?(String) != false || raise("Passed value for field obj.admission_date is not the expected type, validation failed.")
          obj.discharge_date&.is_a?(String) != false || raise("Passed value for field obj.discharge_date is not the expected type, validation failed.")
          obj.onset_of_current_illness_or_symptom_date&.is_a?(String) != false || raise("Passed value for field obj.onset_of_current_illness_or_symptom_date is not the expected type, validation failed.")
          obj.last_menstrual_period_date&.is_a?(String) != false || raise("Passed value for field obj.last_menstrual_period_date is not the expected type, validation failed.")
          obj.delay_reason_code&.is_a?(Commons::DelayReasonCode) != false || raise("Passed value for field obj.delay_reason_code is not the expected type, validation failed.")
        end
      end
    end
  end
end
