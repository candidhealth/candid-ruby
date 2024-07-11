# frozen_string_literal: true

require_relative "../../../commons/types/phone_number"
require "date"
require_relative "../../../commons/types/street_address_short_zip"
require "ostruct"
require "json"

module CandidApiClient
  module Guarantor
    module V1
      module Types
        class GuarantorCreate
          # @return [Array<CandidApiClient::Commons::Types::PhoneNumber>]
          attr_reader :phone_numbers
          # @return [Boolean] Defaults to false
          attr_reader :phone_consent
          # @return [String]
          attr_reader :email
          # @return [Boolean] Defaults to false
          attr_reader :email_consent
          # @return [String]
          attr_reader :first_name
          # @return [String]
          attr_reader :last_name
          # @return [String]
          attr_reader :external_id
          # @return [Date]
          attr_reader :date_of_birth
          # @return [CandidApiClient::Commons::Types::StreetAddressShortZip]
          attr_reader :address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param phone_numbers [Array<CandidApiClient::Commons::Types::PhoneNumber>]
          # @param phone_consent [Boolean] Defaults to false
          # @param email [String]
          # @param email_consent [Boolean] Defaults to false
          # @param first_name [String]
          # @param last_name [String]
          # @param external_id [String]
          # @param date_of_birth [Date]
          # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Guarantor::V1::Types::GuarantorCreate]
          def initialize(first_name:, last_name:, external_id:, phone_numbers: OMIT, phone_consent: OMIT, email: OMIT,
                         email_consent: OMIT, date_of_birth: OMIT, address: OMIT, additional_properties: nil)
            @phone_numbers = phone_numbers if phone_numbers != OMIT
            @phone_consent = phone_consent if phone_consent != OMIT
            @email = email if email != OMIT
            @email_consent = email_consent if email_consent != OMIT
            @first_name = first_name
            @last_name = last_name
            @external_id = external_id
            @date_of_birth = date_of_birth if date_of_birth != OMIT
            @address = address if address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "phone_numbers": phone_numbers,
              "phone_consent": phone_consent,
              "email": email,
              "email_consent": email_consent,
              "first_name": first_name,
              "last_name": last_name,
              "external_id": external_id,
              "date_of_birth": date_of_birth,
              "address": address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of GuarantorCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::Guarantor::V1::Types::GuarantorCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            phone_numbers = parsed_json["phone_numbers"]&.map do |item|
              item = item.to_json
              CandidApiClient::Commons::Types::PhoneNumber.from_json(json_object: item)
            end
            phone_consent = struct["phone_consent"]
            email = struct["email"]
            email_consent = struct["email_consent"]
            first_name = struct["first_name"]
            last_name = struct["last_name"]
            external_id = struct["external_id"]
            date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressShortZip.from_json(json_object: address)
            end
            new(
              phone_numbers: phone_numbers,
              phone_consent: phone_consent,
              email: email,
              email_consent: email_consent,
              first_name: first_name,
              last_name: last_name,
              external_id: external_id,
              date_of_birth: date_of_birth,
              address: address,
              additional_properties: struct
            )
          end

          # Serialize an instance of GuarantorCreate to a JSON object
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
            obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
            obj.phone_consent&.is_a?(Boolean) != false || raise("Passed value for field obj.phone_consent is not the expected type, validation failed.")
            obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
            obj.email_consent&.is_a?(Boolean) != false || raise("Passed value for field obj.email_consent is not the expected type, validation failed.")
            obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
            obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
            obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
            obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressShortZip.validate_raw(obj: obj.address)
          end
        end
      end
    end
  end
end
