# frozen_string_literal: true

require_relative "gender"
require "date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "../../commons/types/phone_number"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientUpdate
        # @return [String]
        attr_reader :first_name
        # @return [String]
        attr_reader :last_name
        # @return [CandidApiClient::Individual::Types::Gender]
        attr_reader :gender
        # @return [String] The ID used to identify this individual in your system. For example, your
        #  internal patient ID or an EHR patient ID.
        attr_reader :external_id
        # @return [Date] Box 3 on the CMS-1500 claim form. The date format should be in ISO 8601 date;
        #  formatted YYYY-MM-DD (i.e. 2012-02-01)
        attr_reader :date_of_birth
        # @return [CandidApiClient::Commons::Types::StreetAddressShortZip] Box 5 on the CMS-1500 claim form.
        attr_reader :address
        # @return [Array<CandidApiClient::Commons::Types::PhoneNumber>]
        attr_reader :phone_numbers
        # @return [Boolean]
        attr_reader :phone_consent
        # @return [String]
        attr_reader :email
        # @return [Boolean]
        attr_reader :email_consent
        # @return [Array<String>] On update, we will replace the existing list of non-insurance payers with the
        #  new list if populated.
        attr_reader :non_insurance_payers
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param first_name [String]
        # @param last_name [String]
        # @param gender [CandidApiClient::Individual::Types::Gender]
        # @param external_id [String] The ID used to identify this individual in your system. For example, your
        #  internal patient ID or an EHR patient ID.
        # @param date_of_birth [Date] Box 3 on the CMS-1500 claim form. The date format should be in ISO 8601 date;
        #  formatted YYYY-MM-DD (i.e. 2012-02-01)
        # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip] Box 5 on the CMS-1500 claim form.
        # @param phone_numbers [Array<CandidApiClient::Commons::Types::PhoneNumber>]
        # @param phone_consent [Boolean]
        # @param email [String]
        # @param email_consent [Boolean]
        # @param non_insurance_payers [Array<String>] On update, we will replace the existing list of non-insurance payers with the
        #  new list if populated.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientUpdate]
        def initialize(first_name: OMIT, last_name: OMIT, gender: OMIT, external_id: OMIT, date_of_birth: OMIT,
                       address: OMIT, phone_numbers: OMIT, phone_consent: OMIT, email: OMIT, email_consent: OMIT, non_insurance_payers: OMIT, additional_properties: nil)
          @first_name = first_name if first_name != OMIT
          @last_name = last_name if last_name != OMIT
          @gender = gender if gender != OMIT
          @external_id = external_id if external_id != OMIT
          @date_of_birth = date_of_birth if date_of_birth != OMIT
          @address = address if address != OMIT
          @phone_numbers = phone_numbers if phone_numbers != OMIT
          @phone_consent = phone_consent if phone_consent != OMIT
          @email = email if email != OMIT
          @email_consent = email_consent if email_consent != OMIT
          @non_insurance_payers = non_insurance_payers if non_insurance_payers != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "first_name": first_name,
            "last_name": last_name,
            "gender": gender,
            "external_id": external_id,
            "date_of_birth": date_of_birth,
            "address": address,
            "phone_numbers": phone_numbers,
            "phone_consent": phone_consent,
            "email": email,
            "email_consent": email_consent,
            "non_insurance_payers": non_insurance_payers
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientUpdate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientUpdate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          first_name = struct["first_name"]
          last_name = struct["last_name"]
          gender = struct["gender"]
          external_id = struct["external_id"]
          date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = CandidApiClient::Commons::Types::StreetAddressShortZip.from_json(json_object: address)
          end
          phone_numbers = parsed_json["phone_numbers"]&.map do |item|
            item = item.to_json
            CandidApiClient::Commons::Types::PhoneNumber.from_json(json_object: item)
          end
          phone_consent = struct["phone_consent"]
          email = struct["email"]
          email_consent = struct["email_consent"]
          non_insurance_payers = struct["non_insurance_payers"]
          new(
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            external_id: external_id,
            date_of_birth: date_of_birth,
            address: address,
            phone_numbers: phone_numbers,
            phone_consent: phone_consent,
            email: email,
            email_consent: email_consent,
            non_insurance_payers: non_insurance_payers,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientUpdate to a JSON object
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
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.gender&.is_a?(CandidApiClient::Individual::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
          obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
          obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressShortZip.validate_raw(obj: obj.address)
          obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
          obj.phone_consent&.is_a?(Boolean) != false || raise("Passed value for field obj.phone_consent is not the expected type, validation failed.")
          obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
          obj.email_consent&.is_a?(Boolean) != false || raise("Passed value for field obj.email_consent is not the expected type, validation failed.")
          obj.non_insurance_payers&.is_a?(Array) != false || raise("Passed value for field obj.non_insurance_payers is not the expected type, validation failed.")
        end
      end
    end
  end
end
