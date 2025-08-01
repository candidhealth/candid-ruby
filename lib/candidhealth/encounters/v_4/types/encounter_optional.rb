# frozen_string_literal: true

require "date"
require_relative "billable_status_type"
require_relative "responsible_party_type"
require_relative "synchronicity_type"
require_relative "../../../commons/types/facility_type_code"
require_relative "service_authorization_exception_code"
require_relative "../../../commons/types/delay_reason_code"
require_relative "vitals_update"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class EncounterOptional
          # @return [Boolean] Whether this patient has authorized insurance payments to be made to you, not
          #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
          #  form.
          attr_reader :benefits_assigned_to_provider
          # @return [String] Box 23 on the CMS-1500 claim form.
          attr_reader :prior_authorization_number
          # @return [String] A client-specified unique ID to associate with this encounter;
          #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #  This field should not contain PHI.
          attr_reader :external_id
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          #  Box 24a on the CMS-1500 claim form.
          #  If service occurred over a range of dates, this should be the start date.
          #  If service lines have distinct date_of_service values, updating the encounter's
          #  date_of_service will fail. If all service line date_of_service values are the
          #  same, updating the encounter's date_of_service will update all service line
          #  date_of_service values.
          attr_reader :date_of_service
          # @return [Array<String>] Names of tags that should be on the encounter.  Note all tags on encounter will
          #  be overridden with this list.
          attr_reader :tag_ids
          # @return [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
          #  has not occurred yet or if there is no intention of ever billing the
          #  responsible_party.
          attr_reader :billable_status
          # @return [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
          #  SELF_PAY if you intend to bill self pay/cash pay.
          attr_reader :responsible_party
          # @return [Boolean] Whether you have accepted the patient's authorization for insurance payments to
          #  be made to you, not them. Box 27 on the CMS-1500 claim form.
          attr_reader :provider_accepts_assignment
          # @return [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
          #  encounters occur when providers and patients communicate online using forms,
          #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
          #  occur in live, real-time settings where the patient interacts directly with the
          #  provider, such as over video or a phone call.
          attr_reader :synchronicity
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          attr_reader :place_of_service_code
          # @return [String] Human-readable description of the appointment type (ex: "Acupuncture -
          #  Headaches").
          attr_reader :appointment_type
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
          #  This date must be the local date in the timezone where the service occurred.
          #  If omitted, the Encounter is assumed to be for a single day.
          #  Must not be temporally before the date_of_service field.
          #  If service lines have distinct end_date_of_service values, updating the
          #  encounter's end_date_of_service will fail. If all service line
          #  end_date_of_service values are the same, updating the encounter's
          #  end_date_of_service will update all service line date_of_service values.
          attr_reader :end_date_of_service
          # @return [String] Defines additional information on the claim needed by the payer.
          #  Box 19 on the CMS-1500 claim form.
          attr_reader :additional_information
          # @return [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
          #  Required when mandated by government law or regulation to obtain authorization
          #  for specific service(s) but, for the
          #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
          #  the service was performed without
          #  obtaining the authorization.
          attr_reader :service_authorization_exception_code
          # @return [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18
          #  Required on all ambulance claims when the patient was known to be admitted to
          #  the hospital.
          #  OR
          #  Required on all claims involving inpatient medical visits.
          attr_reader :admission_date
          # @return [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18
          #  Required for inpatient claims when the patient was discharged from the facility
          #  and the discharge date is known.
          attr_reader :discharge_date
          # @return [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
          #  Required for the initial medical service or visit performed in response to a
          #  medical emergency when the date is available and is different than the date of
          #  service.
          #  OR
          #  This date is the onset of acute symptoms for the current illness or condition.
          attr_reader :onset_of_current_illness_or_symptom_date
          # @return [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
          #  Required when, in the judgment of the provider, the services on this claim are
          #  related to the patient's pregnancy.de
          attr_reader :last_menstrual_period_date
          # @return [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #  Code indicating the reason why a request was delayed
          attr_reader :delay_reason_code
          # @return [Boolean] Whether this patient has authorized the release of medical information
          #  for billing purpose.
          #  Box 12 on the CMS-1500 claim form.
          attr_reader :patient_authorized_release
          # @return [CandidApiClient::Encounters::V4::Types::VitalsUpdate] If a vitals entity already exists for the encounter, then all values will be
          #  updated to the provided values.
          #  Otherwise, a new vitals object will be created for the encounter.
          attr_reader :vitals
          # @return [String] Refers to REF*9F on the 837p. Value cannot be greater than 50 characters.
          attr_reader :referral_number
          # @return [String] When Medicaid is billed as the secondary payer the Carrier Code is used to
          #  identify the primary payer. This is required for certain states.
          attr_reader :secondary_payer_carrier_code
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not
          #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
          #  form.
          # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
          # @param external_id [String] A client-specified unique ID to associate with this encounter;
          #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #  This field should not contain PHI.
          # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          #  Box 24a on the CMS-1500 claim form.
          #  If service occurred over a range of dates, this should be the start date.
          #  If service lines have distinct date_of_service values, updating the encounter's
          #  date_of_service will fail. If all service line date_of_service values are the
          #  same, updating the encounter's date_of_service will update all service line
          #  date_of_service values.
          # @param tag_ids [Array<String>] Names of tags that should be on the encounter.  Note all tags on encounter will
          #  be overridden with this list.
          # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
          #  has not occurred yet or if there is no intention of ever billing the
          #  responsible_party.
          # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
          #  SELF_PAY if you intend to bill self pay/cash pay.
          # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to
          #  be made to you, not them. Box 27 on the CMS-1500 claim form.
          # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
          #  encounters occur when providers and patients communicate online using forms,
          #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
          #  occur in live, real-time settings where the patient interacts directly with the
          #  provider, such as over video or a phone call.
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
          #  Headaches").
          # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
          #  This date must be the local date in the timezone where the service occurred.
          #  If omitted, the Encounter is assumed to be for a single day.
          #  Must not be temporally before the date_of_service field.
          #  If service lines have distinct end_date_of_service values, updating the
          #  encounter's end_date_of_service will fail. If all service line
          #  end_date_of_service values are the same, updating the encounter's
          #  end_date_of_service will update all service line date_of_service values.
          # @param additional_information [String] Defines additional information on the claim needed by the payer.
          #  Box 19 on the CMS-1500 claim form.
          # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
          #  Required when mandated by government law or regulation to obtain authorization
          #  for specific service(s) but, for the
          #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
          #  the service was performed without
          #  obtaining the authorization.
          # @param admission_date [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18
          #  Required on all ambulance claims when the patient was known to be admitted to
          #  the hospital.
          #  OR
          #  Required on all claims involving inpatient medical visits.
          # @param discharge_date [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18
          #  Required for inpatient claims when the patient was discharged from the facility
          #  and the discharge date is known.
          # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
          #  Required for the initial medical service or visit performed in response to a
          #  medical emergency when the date is available and is different than the date of
          #  service.
          #  OR
          #  This date is the onset of acute symptoms for the current illness or condition.
          # @param last_menstrual_period_date [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
          #  Required when, in the judgment of the provider, the services on this claim are
          #  related to the patient's pregnancy.de
          # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #  Code indicating the reason why a request was delayed
          # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
          #  for billing purpose.
          #  Box 12 on the CMS-1500 claim form.
          # @param vitals [CandidApiClient::Encounters::V4::Types::VitalsUpdate] If a vitals entity already exists for the encounter, then all values will be
          #  updated to the provided values.
          #  Otherwise, a new vitals object will be created for the encounter.
          # @param referral_number [String] Refers to REF*9F on the 837p. Value cannot be greater than 50 characters.
          # @param secondary_payer_carrier_code [String] When Medicaid is billed as the secondary payer the Carrier Code is used to
          #  identify the primary payer. This is required for certain states.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::EncounterOptional]
          def initialize(benefits_assigned_to_provider: OMIT, prior_authorization_number: OMIT, external_id: OMIT,
                         date_of_service: OMIT, tag_ids: OMIT, billable_status: OMIT, responsible_party: OMIT, provider_accepts_assignment: OMIT, synchronicity: OMIT, place_of_service_code: OMIT, appointment_type: OMIT, end_date_of_service: OMIT, additional_information: OMIT, service_authorization_exception_code: OMIT, admission_date: OMIT, discharge_date: OMIT, onset_of_current_illness_or_symptom_date: OMIT, last_menstrual_period_date: OMIT, delay_reason_code: OMIT, patient_authorized_release: OMIT, vitals: OMIT, referral_number: OMIT, secondary_payer_carrier_code: OMIT, additional_properties: nil)
            @benefits_assigned_to_provider = benefits_assigned_to_provider if benefits_assigned_to_provider != OMIT
            @prior_authorization_number = prior_authorization_number if prior_authorization_number != OMIT
            @external_id = external_id if external_id != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @tag_ids = tag_ids if tag_ids != OMIT
            @billable_status = billable_status if billable_status != OMIT
            @responsible_party = responsible_party if responsible_party != OMIT
            @provider_accepts_assignment = provider_accepts_assignment if provider_accepts_assignment != OMIT
            @synchronicity = synchronicity if synchronicity != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            @appointment_type = appointment_type if appointment_type != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
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
            @patient_authorized_release = patient_authorized_release if patient_authorized_release != OMIT
            @vitals = vitals if vitals != OMIT
            @referral_number = referral_number if referral_number != OMIT
            @secondary_payer_carrier_code = secondary_payer_carrier_code if secondary_payer_carrier_code != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "benefits_assigned_to_provider": benefits_assigned_to_provider,
              "prior_authorization_number": prior_authorization_number,
              "external_id": external_id,
              "date_of_service": date_of_service,
              "tag_ids": tag_ids,
              "billable_status": billable_status,
              "responsible_party": responsible_party,
              "provider_accepts_assignment": provider_accepts_assignment,
              "synchronicity": synchronicity,
              "place_of_service_code": place_of_service_code,
              "appointment_type": appointment_type,
              "end_date_of_service": end_date_of_service,
              "additional_information": additional_information,
              "service_authorization_exception_code": service_authorization_exception_code,
              "admission_date": admission_date,
              "discharge_date": discharge_date,
              "onset_of_current_illness_or_symptom_date": onset_of_current_illness_or_symptom_date,
              "last_menstrual_period_date": last_menstrual_period_date,
              "delay_reason_code": delay_reason_code,
              "patient_authorized_release": patient_authorized_release,
              "vitals": vitals,
              "referral_number": referral_number,
              "secondary_payer_carrier_code": secondary_payer_carrier_code
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of EncounterOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::EncounterOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            benefits_assigned_to_provider = struct["benefits_assigned_to_provider"]
            prior_authorization_number = struct["prior_authorization_number"]
            external_id = struct["external_id"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            tag_ids = struct["tag_ids"]
            billable_status = struct["billable_status"]
            responsible_party = struct["responsible_party"]
            provider_accepts_assignment = struct["provider_accepts_assignment"]
            synchronicity = struct["synchronicity"]
            place_of_service_code = struct["place_of_service_code"]
            appointment_type = struct["appointment_type"]
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
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
            patient_authorized_release = struct["patient_authorized_release"]
            if parsed_json["vitals"].nil?
              vitals = nil
            else
              vitals = parsed_json["vitals"].to_json
              vitals = CandidApiClient::Encounters::V4::Types::VitalsUpdate.from_json(json_object: vitals)
            end
            referral_number = struct["referral_number"]
            secondary_payer_carrier_code = struct["secondary_payer_carrier_code"]
            new(
              benefits_assigned_to_provider: benefits_assigned_to_provider,
              prior_authorization_number: prior_authorization_number,
              external_id: external_id,
              date_of_service: date_of_service,
              tag_ids: tag_ids,
              billable_status: billable_status,
              responsible_party: responsible_party,
              provider_accepts_assignment: provider_accepts_assignment,
              synchronicity: synchronicity,
              place_of_service_code: place_of_service_code,
              appointment_type: appointment_type,
              end_date_of_service: end_date_of_service,
              additional_information: additional_information,
              service_authorization_exception_code: service_authorization_exception_code,
              admission_date: admission_date,
              discharge_date: discharge_date,
              onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
              last_menstrual_period_date: last_menstrual_period_date,
              delay_reason_code: delay_reason_code,
              patient_authorized_release: patient_authorized_release,
              vitals: vitals,
              referral_number: referral_number,
              secondary_payer_carrier_code: secondary_payer_carrier_code,
              additional_properties: struct
            )
          end

          # Serialize an instance of EncounterOptional to a JSON object
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
            obj.benefits_assigned_to_provider&.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
            obj.prior_authorization_number&.is_a?(String) != false || raise("Passed value for field obj.prior_authorization_number is not the expected type, validation failed.")
            obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
            obj.billable_status&.is_a?(CandidApiClient::Encounters::V4::Types::BillableStatusType) != false || raise("Passed value for field obj.billable_status is not the expected type, validation failed.")
            obj.responsible_party&.is_a?(CandidApiClient::Encounters::V4::Types::ResponsiblePartyType) != false || raise("Passed value for field obj.responsible_party is not the expected type, validation failed.")
            obj.provider_accepts_assignment&.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
            obj.synchronicity&.is_a?(CandidApiClient::Encounters::V4::Types::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.additional_information&.is_a?(String) != false || raise("Passed value for field obj.additional_information is not the expected type, validation failed.")
            obj.service_authorization_exception_code&.is_a?(CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode) != false || raise("Passed value for field obj.service_authorization_exception_code is not the expected type, validation failed.")
            obj.admission_date&.is_a?(Date) != false || raise("Passed value for field obj.admission_date is not the expected type, validation failed.")
            obj.discharge_date&.is_a?(Date) != false || raise("Passed value for field obj.discharge_date is not the expected type, validation failed.")
            obj.onset_of_current_illness_or_symptom_date&.is_a?(Date) != false || raise("Passed value for field obj.onset_of_current_illness_or_symptom_date is not the expected type, validation failed.")
            obj.last_menstrual_period_date&.is_a?(Date) != false || raise("Passed value for field obj.last_menstrual_period_date is not the expected type, validation failed.")
            obj.delay_reason_code&.is_a?(CandidApiClient::Commons::Types::DelayReasonCode) != false || raise("Passed value for field obj.delay_reason_code is not the expected type, validation failed.")
            obj.patient_authorized_release&.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
            obj.vitals.nil? || CandidApiClient::Encounters::V4::Types::VitalsUpdate.validate_raw(obj: obj.vitals)
            obj.referral_number&.is_a?(String) != false || raise("Passed value for field obj.referral_number is not the expected type, validation failed.")
            obj.secondary_payer_carrier_code&.is_a?(String) != false || raise("Passed value for field obj.secondary_payer_carrier_code is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
