# frozen_string_literal: true

require_relative "../../../common/types/human_name"
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
require_relative "external_provider"
require_relative "filing_order"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          # An object representing patient demographics information.
          class MutablePatient
            # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
            attr_reader :name
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::HumanName>] Other names for the patient.
            attr_reader :other_names
            # @return [CandidApiClient::PreEncounter::Common::Types::Gender]
            attr_reader :gender
            # @return [Date]
            attr_reader :birth_date
            # @return [String]
            attr_reader :social_security_number
            # @return [CandidApiClient::PreEncounter::Common::Types::Sex] The biological sex of the patient.
            attr_reader :biological_sex
            # @return [CandidApiClient::PreEncounter::Common::Types::SexualOrientation] The sexual orientation of the patient.
            attr_reader :sexual_orientation
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
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>]
            attr_reader :general_practitioners
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            attr_reader :filing_order
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
            # @param other_names [Array<CandidApiClient::PreEncounter::Common::Types::HumanName>] Other names for the patient.
            # @param gender [CandidApiClient::PreEncounter::Common::Types::Gender]
            # @param birth_date [Date]
            # @param social_security_number [String]
            # @param biological_sex [CandidApiClient::PreEncounter::Common::Types::Sex] The biological sex of the patient.
            # @param sexual_orientation [CandidApiClient::PreEncounter::Common::Types::SexualOrientation] The sexual orientation of the patient.
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
            # @param general_practitioners [Array<CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider>]
            # @param filing_order [CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient]
            def initialize(name:, other_names:, birth_date:, primary_address:, other_addresses:, primary_telecom:, other_telecoms:, contacts:, general_practitioners:, filing_order:, gender: OMIT, social_security_number: OMIT,
                           biological_sex: OMIT, sexual_orientation: OMIT, race: OMIT, ethnicity: OMIT, disability_status: OMIT, marital_status: OMIT, deceased: OMIT, multiple_birth: OMIT, email: OMIT, electronic_communication_opt_in: OMIT, photo: OMIT, language: OMIT, external_provenance: OMIT, additional_properties: nil)
              @name = name
              @other_names = other_names
              @gender = gender if gender != OMIT
              @birth_date = birth_date
              @social_security_number = social_security_number if social_security_number != OMIT
              @biological_sex = biological_sex if biological_sex != OMIT
              @sexual_orientation = sexual_orientation if sexual_orientation != OMIT
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
              @additional_properties = additional_properties
              @_field_set = {
                "name": name,
                "other_names": other_names,
                "gender": gender,
                "birth_date": birth_date,
                "social_security_number": social_security_number,
                "biological_sex": biological_sex,
                "sexual_orientation": sexual_orientation,
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
                "filing_order": filing_order
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutablePatient
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatient]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
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
              gender = struct["gender"]
              birth_date = (Date.parse(parsed_json["birth_date"]) unless parsed_json["birth_date"].nil?)
              social_security_number = struct["social_security_number"]
              biological_sex = struct["biological_sex"]
              sexual_orientation = struct["sexual_orientation"]
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
                CandidApiClient::PreEncounter::Patients::V1::Types::ExternalProvider.from_json(json_object: item)
              end
              if parsed_json["filing_order"].nil?
                filing_order = nil
              else
                filing_order = parsed_json["filing_order"].to_json
                filing_order = CandidApiClient::PreEncounter::Patients::V1::Types::FilingOrder.from_json(json_object: filing_order)
              end
              new(
                name: name,
                other_names: other_names,
                gender: gender,
                birth_date: birth_date,
                social_security_number: social_security_number,
                biological_sex: biological_sex,
                sexual_orientation: sexual_orientation,
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
                additional_properties: struct
              )
            end

            # Serialize an instance of MutablePatient to a JSON object
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
              CandidApiClient::PreEncounter::Common::Types::HumanName.validate_raw(obj: obj.name)
              obj.other_names.is_a?(Array) != false || raise("Passed value for field obj.other_names is not the expected type, validation failed.")
              obj.gender&.is_a?(CandidApiClient::PreEncounter::Common::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
              obj.birth_date.is_a?(Date) != false || raise("Passed value for field obj.birth_date is not the expected type, validation failed.")
              obj.social_security_number&.is_a?(String) != false || raise("Passed value for field obj.social_security_number is not the expected type, validation failed.")
              obj.biological_sex&.is_a?(CandidApiClient::PreEncounter::Common::Types::Sex) != false || raise("Passed value for field obj.biological_sex is not the expected type, validation failed.")
              obj.sexual_orientation&.is_a?(CandidApiClient::PreEncounter::Common::Types::SexualOrientation) != false || raise("Passed value for field obj.sexual_orientation is not the expected type, validation failed.")
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
            end
          end
        end
      end
    end
  end
end
