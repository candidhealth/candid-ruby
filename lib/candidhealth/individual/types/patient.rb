# frozen_string_literal: true

require_relative "../../commons/types/phone_number"
require_relative "../../non_insurance_payers/v_1/types/non_insurance_payer"
require_relative "patient_non_insurance_payer_info"
require "date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "gender"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class Patient
        # @return [String]
        attr_reader :individual_id
        # @return [Array<CandidApiClient::Commons::Types::PhoneNumber>]
        attr_reader :phone_numbers
        # @return [Boolean]
        attr_reader :phone_consent
        # @return [String]
        attr_reader :email
        # @return [Boolean]
        attr_reader :email_consent
        # @return [Boolean]
        attr_reader :auto_charge_consent
        # @return [Array<CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer>]
        attr_reader :non_insurance_payers
        # @return [Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo>]
        attr_reader :non_insurance_payers_info
        # @return [String] The ID used to identify this individual in your system. For example, your
        #  internal patient ID or an EHR patient ID.
        attr_reader :external_id
        # @return [Date] Box 3 on the CMS-1500 claim form or Form Locator 10 on a UB-04 claim form. The
        #  date format should be in ISO 8601 date; formatted YYYY-MM-DD (i.e. 2012-02-01)
        attr_reader :date_of_birth
        # @return [CandidApiClient::Commons::Types::StreetAddressShortZip] Box 5 on the CMS-1500 claim form or Form Locator 9 on a UB-04 claim form.
        attr_reader :address
        # @return [String]
        attr_reader :first_name
        # @return [String]
        attr_reader :last_name
        # @return [CandidApiClient::Individual::Types::Gender]
        attr_reader :gender
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param individual_id [String]
        # @param phone_numbers [Array<CandidApiClient::Commons::Types::PhoneNumber>]
        # @param phone_consent [Boolean]
        # @param email [String]
        # @param email_consent [Boolean]
        # @param auto_charge_consent [Boolean]
        # @param non_insurance_payers [Array<CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer>]
        # @param non_insurance_payers_info [Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo>]
        # @param external_id [String] The ID used to identify this individual in your system. For example, your
        #  internal patient ID or an EHR patient ID.
        # @param date_of_birth [Date] Box 3 on the CMS-1500 claim form or Form Locator 10 on a UB-04 claim form. The
        #  date format should be in ISO 8601 date; formatted YYYY-MM-DD (i.e. 2012-02-01)
        # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip] Box 5 on the CMS-1500 claim form or Form Locator 9 on a UB-04 claim form.
        # @param first_name [String]
        # @param last_name [String]
        # @param gender [CandidApiClient::Individual::Types::Gender]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::Patient]
        def initialize(individual_id:, phone_numbers:, phone_consent:, email_consent:, auto_charge_consent:,
                       non_insurance_payers:, non_insurance_payers_info:, external_id:, date_of_birth:, address:, first_name:, last_name:, gender:, email: OMIT, additional_properties: nil)
          @individual_id = individual_id
          @phone_numbers = phone_numbers
          @phone_consent = phone_consent
          @email = email if email != OMIT
          @email_consent = email_consent
          @auto_charge_consent = auto_charge_consent
          @non_insurance_payers = non_insurance_payers
          @non_insurance_payers_info = non_insurance_payers_info
          @external_id = external_id
          @date_of_birth = date_of_birth
          @address = address
          @first_name = first_name
          @last_name = last_name
          @gender = gender
          @additional_properties = additional_properties
          @_field_set = {
            "individual_id": individual_id,
            "phone_numbers": phone_numbers,
            "phone_consent": phone_consent,
            "email": email,
            "email_consent": email_consent,
            "auto_charge_consent": auto_charge_consent,
            "non_insurance_payers": non_insurance_payers,
            "non_insurance_payers_info": non_insurance_payers_info,
            "external_id": external_id,
            "date_of_birth": date_of_birth,
            "address": address,
            "first_name": first_name,
            "last_name": last_name,
            "gender": gender
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of Patient
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::Patient]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          individual_id = struct["individual_id"]
          phone_numbers = parsed_json["phone_numbers"]&.map do |item|
            item = item.to_json
            CandidApiClient::Commons::Types::PhoneNumber.from_json(json_object: item)
          end
          phone_consent = struct["phone_consent"]
          email = struct["email"]
          email_consent = struct["email_consent"]
          auto_charge_consent = struct["auto_charge_consent"]
          non_insurance_payers = parsed_json["non_insurance_payers"]&.map do |item|
            item = item.to_json
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: item)
          end
          non_insurance_payers_info = parsed_json["non_insurance_payers_info"]&.map do |item|
            item = item.to_json
            CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo.from_json(json_object: item)
          end
          external_id = struct["external_id"]
          date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = CandidApiClient::Commons::Types::StreetAddressShortZip.from_json(json_object: address)
          end
          first_name = struct["first_name"]
          last_name = struct["last_name"]
          gender = struct["gender"]
          new(
            individual_id: individual_id,
            phone_numbers: phone_numbers,
            phone_consent: phone_consent,
            email: email,
            email_consent: email_consent,
            auto_charge_consent: auto_charge_consent,
            non_insurance_payers: non_insurance_payers,
            non_insurance_payers_info: non_insurance_payers_info,
            external_id: external_id,
            date_of_birth: date_of_birth,
            address: address,
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            additional_properties: struct
          )
        end

        # Serialize an instance of Patient to a JSON object
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
          obj.individual_id.is_a?(String) != false || raise("Passed value for field obj.individual_id is not the expected type, validation failed.")
          obj.phone_numbers.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
          obj.phone_consent.is_a?(Boolean) != false || raise("Passed value for field obj.phone_consent is not the expected type, validation failed.")
          obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
          obj.email_consent.is_a?(Boolean) != false || raise("Passed value for field obj.email_consent is not the expected type, validation failed.")
          obj.auto_charge_consent.is_a?(Boolean) != false || raise("Passed value for field obj.auto_charge_consent is not the expected type, validation failed.")
          obj.non_insurance_payers.is_a?(Array) != false || raise("Passed value for field obj.non_insurance_payers is not the expected type, validation failed.")
          obj.non_insurance_payers_info.is_a?(Array) != false || raise("Passed value for field obj.non_insurance_payers_info is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_birth.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
          CandidApiClient::Commons::Types::StreetAddressShortZip.validate_raw(obj: obj.address)
          obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.gender.is_a?(CandidApiClient::Individual::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        end
      end
    end
  end
end
