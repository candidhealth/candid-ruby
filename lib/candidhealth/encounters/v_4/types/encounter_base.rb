# frozen_string_literal: true

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
      class EncounterBase
        attr_reader :external_id, :date_of_service, :end_date_of_service, :prior_authorization_number,
                    :patient_authorized_release, :benefits_assigned_to_provider, :provider_accepts_assignment, :appointment_type, :existing_medications, :vitals, :interventions, :pay_to_address, :synchronicity, :billable_status, :responsible_party, :additional_information, :service_authorization_exception_code, :admission_date, :discharge_date, :onset_of_current_illness_or_symptom_date, :last_menstrual_period_date, :delay_reason_code, :additional_properties

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
        # @return [Encounters::V4::EncounterBase]
        def initialize(external_id:, date_of_service:, patient_authorized_release:, benefits_assigned_to_provider:,
                       provider_accepts_assignment:, billable_status:, responsible_party:, end_date_of_service: nil, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil)
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

        # Deserialize a JSON object to an instance of EncounterBase
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::EncounterBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
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
          new(external_id: external_id, date_of_service: date_of_service, end_date_of_service: end_date_of_service,
              prior_authorization_number: prior_authorization_number, patient_authorized_release: patient_authorized_release, benefits_assigned_to_provider: benefits_assigned_to_provider, provider_accepts_assignment: provider_accepts_assignment, appointment_type: appointment_type, existing_medications: existing_medications, vitals: vitals, interventions: interventions, pay_to_address: pay_to_address, synchronicity: synchronicity, billable_status: billable_status, responsible_party: responsible_party, additional_information: additional_information, service_authorization_exception_code: service_authorization_exception_code, admission_date: admission_date, discharge_date: discharge_date, onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date, last_menstrual_period_date: last_menstrual_period_date, delay_reason_code: delay_reason_code, additional_properties: struct)
        end

        # Serialize an instance of EncounterBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
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
