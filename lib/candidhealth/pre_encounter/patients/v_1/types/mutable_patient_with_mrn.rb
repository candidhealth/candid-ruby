# frozen_string_literal: true

require_relative "../../../common/types/human_name"
require_relative "../../../common/types/external_identifier"
require_relative "../../../common/types/gender"
require "date"
require_relative "../../../common/types/sex"
require_relative "../../../common/types/sexual_orientation"
require_relative "../../../common/types/race"
require_relative "../../../common/types/ethnicity"
require_relative "../../../common/types/disability_status"
require_relative "marital_status"
require_relative "../../../common/types/address"
require_relative "../../../common/types/contact_point"
require_relative "external_provenance"
require_relative "contact"
require_relative "../../../common/types/external_provider"
require_relative "filing_order"
require_relative "../../../common/types/canonical_non_insurance_payer_association"
require_relative "guarantor"
require_relative "authorization"
require_relative "referral"
require_relative "do_not_invoice_reason"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class MutablePatientWithMrn
            # @return [String] The medical record number for the patient.
            attr_reader :mrn
            # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
            attr_reader :name
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::HumanName>] Other names for the patient.
            attr_reader :other_names
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>] Other identifiers for the patient.
            attr_reader :other_identifiers
            # @return [CandidApiClient::PreEncounter::Common::Types::Gender]
            attr_reader :gender
            # @return [Date]
            attr_reader :birth_date
            # @return [String]
            attr_reader :social_security_number
            # @return [CandidApiClient::PreEncounter::Common::Types::Sex] The biological sex of the patient. This corresponds to the HL7
            #  AdministrativeGender
            #  https://www.hl7.org/fhir/valueset-administrative-gender.html
            attr_reader :biological_sex
            # @return [CandidApiClient::PreEncounter::Common::Types::SexualOrientation] The sexual orientation of the patient.
            attr_reader :sexual_orientation
            # @return [Array<String>] The pronouns of the patient.
            attr_reader :pronouns
            # @return [CandidApiClient::PreEncounter::Common::Types::Race]
            attr_reader :race
            # @return [CandidApiClient::PreEncounter::Common::Types::Ethnicity]
            attr_reader :ethnicity
            # @return [CandidApiClient::PreEncounter::Common::Types::DisabilityStatus]
            attr_reader :disability_status
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus]
            attr_reader :marital_status
            # @return [DateTime] Time of death for the patient. Leave unset if the patient is not deceased.
            attr_reader :deceased
            # @return [Integer] The number of siblings the patient was born with. Leave unset if the patient was
            #  not part of a multiple birth.
            attr_reader :multiple_birth
            # @return [CandidApiClient::PreEncounter::Common::Types::Address] The primary address for the patient.
            attr_reader :primary_address
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::Address>] Other addresses for the patient.
            attr_reader :other_addresses
            # @return [CandidApiClient::PreEncounter::Common::Types::ContactPoint] The primary phone number for the patient.
            attr_reader :primary_telecom
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>] Other phone numbers for the patient.
            attr_reader :other_telecoms
            # @return [String]
            attr_reader :email
            # @return [Boolean]
            attr_reader :electronic_communication_opt_in
            # @return [String]
            attr_reader :photo
            # @return [String]
            attr_reader :language
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvenance] Information about the upstream system that owns this patient data. Leave unset
            #  if Candid owns patient data.
            attr_reader :external_provenance
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>] Contacts for the patient.
            attr_reader :contacts
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>]
            attr_reader :general_practitioners
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            attr_reader :filing_order
            # @return [Array<String>]
            attr_reader :non_insurance_payers
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>]
            attr_reader :non_insurance_payer_associations
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor]
            attr_reader :guarantor
            # @return [Boolean]
            attr_reader :self_pay
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>]
            attr_reader :authorizations
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>]
            attr_reader :referrals
            # @return [String]
            attr_reader :primary_service_facility_id
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason] If this value is defined, the customer will not be invoiced.
            attr_reader :do_not_invoice_reason
            # @return [Array<String>]
            attr_reader :note_ids
            # @return [Array<String>]
            attr_reader :tag_ids
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param mrn [String] The medical record number for the patient.
            # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
            # @param other_names [Array<CandidApiClient::PreEncounter::Common::Types::HumanName>] Other names for the patient.
            # @param other_identifiers [Array<CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier>] Other identifiers for the patient.
            # @param gender [CandidApiClient::PreEncounter::Common::Types::Gender]
            # @param birth_date [Date]
            # @param social_security_number [String]
            # @param biological_sex [CandidApiClient::PreEncounter::Common::Types::Sex] The biological sex of the patient. This corresponds to the HL7
            #  AdministrativeGender
            #  https://www.hl7.org/fhir/valueset-administrative-gender.html
            # @param sexual_orientation [CandidApiClient::PreEncounter::Common::Types::SexualOrientation] The sexual orientation of the patient.
            # @param pronouns [Array<String>] The pronouns of the patient.
            # @param race [CandidApiClient::PreEncounter::Common::Types::Race]
            # @param ethnicity [CandidApiClient::PreEncounter::Common::Types::Ethnicity]
            # @param disability_status [CandidApiClient::PreEncounter::Common::Types::DisabilityStatus]
            # @param marital_status [CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus]
            # @param deceased [DateTime] Time of death for the patient. Leave unset if the patient is not deceased.
            # @param multiple_birth [Integer] The number of siblings the patient was born with. Leave unset if the patient was
            #  not part of a multiple birth.
            # @param primary_address [CandidApiClient::PreEncounter::Common::Types::Address] The primary address for the patient.
            # @param other_addresses [Array<CandidApiClient::PreEncounter::Common::Types::Address>] Other addresses for the patient.
            # @param primary_telecom [CandidApiClient::PreEncounter::Common::Types::ContactPoint] The primary phone number for the patient.
            # @param other_telecoms [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>] Other phone numbers for the patient.
            # @param email [String]
            # @param electronic_communication_opt_in [Boolean]
            # @param photo [String]
            # @param language [String]
            # @param external_provenance [CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvenance] Information about the upstream system that owns this patient data. Leave unset
            #  if Candid owns patient data.
            # @param contacts [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Contact>] Contacts for the patient.
            # @param general_practitioners [Array<CandidApiClient::PreEncounter::Common::Types::ExternalProvider>]
            # @param filing_order [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            # @param non_insurance_payers [Array<String>]
            # @param non_insurance_payer_associations [Array<CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation>]
            # @param guarantor [CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor]
            # @param self_pay [Boolean]
            # @param authorizations [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Authorization>]
            # @param referrals [Array<CandidApiClient::PreEncounter::Patients::V1::Types::Referral>]
            # @param primary_service_facility_id [String]
            # @param do_not_invoice_reason [CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason] If this value is defined, the customer will not be invoiced.
            # @param note_ids [Array<String>]
            # @param tag_ids [Array<String>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            def initialize(mrn:, name:, other_names:, birth_date:, biological_sex:, primary_address:, other_addresses:, primary_telecom:, other_telecoms:, contacts:, general_practitioners:, filing_order:, other_identifiers: OMIT, gender: OMIT,
                           social_security_number: OMIT, sexual_orientation: OMIT, pronouns: OMIT, race: OMIT, ethnicity: OMIT, disability_status: OMIT, marital_status: OMIT, deceased: OMIT, multiple_birth: OMIT, email: OMIT, electronic_communication_opt_in: OMIT, photo: OMIT, language: OMIT, external_provenance: OMIT, non_insurance_payers: OMIT, non_insurance_payer_associations: OMIT, guarantor: OMIT, self_pay: OMIT, authorizations: OMIT, referrals: OMIT, primary_service_facility_id: OMIT, do_not_invoice_reason: OMIT, note_ids: OMIT, tag_ids: OMIT, additional_properties: nil)
              @mrn = mrn
              @name = name
              @other_names = other_names
              @other_identifiers = other_identifiers if other_identifiers != OMIT
              @gender = gender if gender != OMIT
              @birth_date = birth_date
              @social_security_number = social_security_number if social_security_number != OMIT
              @biological_sex = biological_sex
              @sexual_orientation = sexual_orientation if sexual_orientation != OMIT
              @pronouns = pronouns if pronouns != OMIT
              @race = race if race != OMIT
              @ethnicity = ethnicity if ethnicity != OMIT
              @disability_status = disability_status if disability_status != OMIT
              @marital_status = marital_status if marital_status != OMIT
              @deceased = deceased if deceased != OMIT
              @multiple_birth = multiple_birth if multiple_birth != OMIT
              @primary_address = primary_address
              @other_addresses = other_addresses
              @primary_telecom = primary_telecom
              @other_telecoms = other_telecoms
              @email = email if email != OMIT
              if electronic_communication_opt_in != OMIT
                @electronic_communication_opt_in = electronic_communication_opt_in
              end
              @photo = photo if photo != OMIT
              @language = language if language != OMIT
              @external_provenance = external_provenance if external_provenance != OMIT
              @contacts = contacts
              @general_practitioners = general_practitioners
              @filing_order = filing_order
              @non_insurance_payers = non_insurance_payers if non_insurance_payers != OMIT
              if non_insurance_payer_associations != OMIT
                @non_insurance_payer_associations = non_insurance_payer_associations
              end
              @guarantor = guarantor if guarantor != OMIT
              @self_pay = self_pay if self_pay != OMIT
              @authorizations = authorizations if authorizations != OMIT
              @referrals = referrals if referrals != OMIT
              @primary_service_facility_id = primary_service_facility_id if primary_service_facility_id != OMIT
              @do_not_invoice_reason = do_not_invoice_reason if do_not_invoice_reason != OMIT
              @note_ids = note_ids if note_ids != OMIT
              @tag_ids = tag_ids if tag_ids != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "mrn": mrn,
                "name": name,
                "other_names": other_names,
                "other_identifiers": other_identifiers,
                "gender": gender,
                "birth_date": birth_date,
                "social_security_number": social_security_number,
                "biological_sex": biological_sex,
                "sexual_orientation": sexual_orientation,
                "pronouns": pronouns,
                "race": race,
                "ethnicity": ethnicity,
                "disability_status": disability_status,
                "marital_status": marital_status,
                "deceased": deceased,
                "multiple_birth": multiple_birth,
                "primary_address": primary_address,
                "other_addresses": other_addresses,
                "primary_telecom": primary_telecom,
                "other_telecoms": other_telecoms,
                "email": email,
                "electronic_communication_opt_in": electronic_communication_opt_in,
                "photo": photo,
                "language": language,
                "external_provenance": external_provenance,
                "contacts": contacts,
                "general_practitioners": general_practitioners,
                "filing_order": filing_order,
                "non_insurance_payers": non_insurance_payers,
                "non_insurance_payer_associations": non_insurance_payer_associations,
                "guarantor": guarantor,
                "self_pay": self_pay,
                "authorizations": authorizations,
                "referrals": referrals,
                "primary_service_facility_id": primary_service_facility_id,
                "do_not_invoice_reason": do_not_invoice_reason,
                "note_ids": note_ids,
                "tag_ids": tag_ids
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutablePatientWithMrn
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              mrn = struct["mrn"]
              if parsed_json["name"].nil?
                name = nil
              else
                name = parsed_json["name"].to_json
                name = CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: name)
              end
              other_names = parsed_json["other_names"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: item)
              end
              other_identifiers = parsed_json["other_identifiers"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier.from_json(json_object: item)
              end
              gender = struct["gender"]
              birth_date = (Date.parse(parsed_json["birth_date"]) unless parsed_json["birth_date"].nil?)
              social_security_number = struct["social_security_number"]
              biological_sex = struct["biological_sex"]
              sexual_orientation = struct["sexual_orientation"]
              pronouns = struct["pronouns"]
              race = struct["race"]
              ethnicity = struct["ethnicity"]
              disability_status = struct["disability_status"]
              marital_status = struct["marital_status"]
              deceased = (DateTime.parse(parsed_json["deceased"]) unless parsed_json["deceased"].nil?)
              multiple_birth = struct["multiple_birth"]
              if parsed_json["primary_address"].nil?
                primary_address = nil
              else
                primary_address = parsed_json["primary_address"].to_json
                primary_address = CandidApiClient::PreEncounter::Common::Types::Address.from_json(json_object: primary_address)
              end
              other_addresses = parsed_json["other_addresses"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::Address.from_json(json_object: item)
              end
              if parsed_json["primary_telecom"].nil?
                primary_telecom = nil
              else
                primary_telecom = parsed_json["primary_telecom"].to_json
                primary_telecom = CandidApiClient::PreEncounter::Common::Types::ContactPoint.from_json(json_object: primary_telecom)
              end
              other_telecoms = parsed_json["other_telecoms"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::ContactPoint.from_json(json_object: item)
              end
              email = struct["email"]
              electronic_communication_opt_in = struct["electronic_communication_opt_in"]
              photo = struct["photo"]
              language = struct["language"]
              if parsed_json["external_provenance"].nil?
                external_provenance = nil
              else
                external_provenance = parsed_json["external_provenance"].to_json
                external_provenance = CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvenance.from_json(json_object: external_provenance)
              end
              contacts = parsed_json["contacts"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Contact.from_json(json_object: item)
              end
              general_practitioners = parsed_json["general_practitioners"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: item)
              end
              if parsed_json["filing_order"].nil?
                filing_order = nil
              else
                filing_order = parsed_json["filing_order"].to_json
                filing_order = CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder.from_json(json_object: filing_order)
              end
              non_insurance_payers = struct["non_insurance_payers"]
              non_insurance_payer_associations = parsed_json["non_insurance_payer_associations"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation.from_json(json_object: item)
              end
              if parsed_json["guarantor"].nil?
                guarantor = nil
              else
                guarantor = parsed_json["guarantor"].to_json
                guarantor = CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor.from_json(json_object: guarantor)
              end
              self_pay = struct["self_pay"]
              authorizations = parsed_json["authorizations"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Authorization.from_json(json_object: item)
              end
              referrals = parsed_json["referrals"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Patients::V1::Types::Referral.from_json(json_object: item)
              end
              primary_service_facility_id = struct["primary_service_facility_id"]
              do_not_invoice_reason = struct["do_not_invoice_reason"]
              note_ids = struct["note_ids"]
              tag_ids = struct["tag_ids"]
              new(
                mrn: mrn,
                name: name,
                other_names: other_names,
                other_identifiers: other_identifiers,
                gender: gender,
                birth_date: birth_date,
                social_security_number: social_security_number,
                biological_sex: biological_sex,
                sexual_orientation: sexual_orientation,
                pronouns: pronouns,
                race: race,
                ethnicity: ethnicity,
                disability_status: disability_status,
                marital_status: marital_status,
                deceased: deceased,
                multiple_birth: multiple_birth,
                primary_address: primary_address,
                other_addresses: other_addresses,
                primary_telecom: primary_telecom,
                other_telecoms: other_telecoms,
                email: email,
                electronic_communication_opt_in: electronic_communication_opt_in,
                photo: photo,
                language: language,
                external_provenance: external_provenance,
                contacts: contacts,
                general_practitioners: general_practitioners,
                filing_order: filing_order,
                non_insurance_payers: non_insurance_payers,
                non_insurance_payer_associations: non_insurance_payer_associations,
                guarantor: guarantor,
                self_pay: self_pay,
                authorizations: authorizations,
                referrals: referrals,
                primary_service_facility_id: primary_service_facility_id,
                do_not_invoice_reason: do_not_invoice_reason,
                note_ids: note_ids,
                tag_ids: tag_ids,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutablePatientWithMrn to a JSON object
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
              obj.mrn.is_a?(String) != false || raise("Passed value for field obj.mrn is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Common::Types::HumanName.validate_raw(obj: obj.name)
              obj.other_names.is_a?(Array) != false || raise("Passed value for field obj.other_names is not the expected type, validation failed.")
              obj.other_identifiers&.is_a?(Array) != false || raise("Passed value for field obj.other_identifiers is not the expected type, validation failed.")
              obj.gender&.is_a?(CandidApiClient::PreEncounter::Common::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
              obj.birth_date.is_a?(Date) != false || raise("Passed value for field obj.birth_date is not the expected type, validation failed.")
              obj.social_security_number&.is_a?(String) != false || raise("Passed value for field obj.social_security_number is not the expected type, validation failed.")
              obj.biological_sex.is_a?(CandidApiClient::PreEncounter::Common::Types::Sex) != false || raise("Passed value for field obj.biological_sex is not the expected type, validation failed.")
              obj.sexual_orientation&.is_a?(CandidApiClient::PreEncounter::Common::Types::SexualOrientation) != false || raise("Passed value for field obj.sexual_orientation is not the expected type, validation failed.")
              obj.pronouns&.is_a?(Array) != false || raise("Passed value for field obj.pronouns is not the expected type, validation failed.")
              obj.race&.is_a?(CandidApiClient::PreEncounter::Common::Types::Race) != false || raise("Passed value for field obj.race is not the expected type, validation failed.")
              obj.ethnicity&.is_a?(CandidApiClient::PreEncounter::Common::Types::Ethnicity) != false || raise("Passed value for field obj.ethnicity is not the expected type, validation failed.")
              obj.disability_status&.is_a?(CandidApiClient::PreEncounter::Common::Types::DisabilityStatus) != false || raise("Passed value for field obj.disability_status is not the expected type, validation failed.")
              obj.marital_status&.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::MaritalStatus) != false || raise("Passed value for field obj.marital_status is not the expected type, validation failed.")
              obj.deceased&.is_a?(DateTime) != false || raise("Passed value for field obj.deceased is not the expected type, validation failed.")
              obj.multiple_birth&.is_a?(Integer) != false || raise("Passed value for field obj.multiple_birth is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Common::Types::Address.validate_raw(obj: obj.primary_address)
              obj.other_addresses.is_a?(Array) != false || raise("Passed value for field obj.other_addresses is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Common::Types::ContactPoint.validate_raw(obj: obj.primary_telecom)
              obj.other_telecoms.is_a?(Array) != false || raise("Passed value for field obj.other_telecoms is not the expected type, validation failed.")
              obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
              obj.electronic_communication_opt_in&.is_a?(Boolean) != false || raise("Passed value for field obj.electronic_communication_opt_in is not the expected type, validation failed.")
              obj.photo&.is_a?(String) != false || raise("Passed value for field obj.photo is not the expected type, validation failed.")
              obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
              obj.external_provenance.nil? || CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvenance.validate_raw(obj: obj.external_provenance)
              obj.contacts.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
              obj.general_practitioners.is_a?(Array) != false || raise("Passed value for field obj.general_practitioners is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder.validate_raw(obj: obj.filing_order)
              obj.non_insurance_payers&.is_a?(Array) != false || raise("Passed value for field obj.non_insurance_payers is not the expected type, validation failed.")
              obj.non_insurance_payer_associations&.is_a?(Array) != false || raise("Passed value for field obj.non_insurance_payer_associations is not the expected type, validation failed.")
              obj.guarantor.nil? || CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor.validate_raw(obj: obj.guarantor)
              obj.self_pay&.is_a?(Boolean) != false || raise("Passed value for field obj.self_pay is not the expected type, validation failed.")
              obj.authorizations&.is_a?(Array) != false || raise("Passed value for field obj.authorizations is not the expected type, validation failed.")
              obj.referrals&.is_a?(Array) != false || raise("Passed value for field obj.referrals is not the expected type, validation failed.")
              obj.primary_service_facility_id&.is_a?(String) != false || raise("Passed value for field obj.primary_service_facility_id is not the expected type, validation failed.")
              obj.do_not_invoice_reason&.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::DoNotInvoiceReason) != false || raise("Passed value for field obj.do_not_invoice_reason is not the expected type, validation failed.")
              obj.note_ids&.is_a?(Array) != false || raise("Passed value for field obj.note_ids is not the expected type, validation failed.")
              obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
