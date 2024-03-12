# frozen_string_literal: true

require_relative "../../commons/types/date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "gender"
require "json"

module CandidApiClient
  class Individual
    class PatientBase
      attr_reader :external_id, :date_of_birth, :address, :first_name, :last_name, :gender, :additional_properties

      # @param external_id [String] The ID used to identify this individual in your system. For example, your internal patient ID or an EHR patient ID.
      # @param date_of_birth [Commons::DATE] Box 3 on the CMS-1500 claim form. The date format should be in ISO 8601 date; formatted YYYY-MM-DD (i.e. 2012-02-01)
      # @param address [Commons::StreetAddressShortZip] Box 5 on the CMS-1500 claim form.
      # @param first_name [String]
      # @param last_name [String]
      # @param gender [Individual::Gender]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Individual::PatientBase]
      def initialize(external_id:, date_of_birth:, address:, first_name:, last_name:, gender:,
                     additional_properties: nil)
        # @type [String] The ID used to identify this individual in your system. For example, your internal patient ID or an EHR patient ID.
        @external_id = external_id
        # @type [Commons::DATE] Box 3 on the CMS-1500 claim form. The date format should be in ISO 8601 date; formatted YYYY-MM-DD (i.e. 2012-02-01)
        @date_of_birth = date_of_birth
        # @type [Commons::StreetAddressShortZip] Box 5 on the CMS-1500 claim form.
        @address = address
        # @type [String]
        @first_name = first_name
        # @type [String]
        @last_name = last_name
        # @type [Individual::Gender]
        @gender = gender
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PatientBase
      #
      # @param json_object [JSON]
      # @return [Individual::PatientBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        external_id = struct.external_id
        date_of_birth = struct.date_of_birth
        if parsed_json["address"].nil?
          address = nil
        else
          address = parsed_json["address"].to_json
          address = Commons::StreetAddressShortZip.from_json(json_object: address)
        end
        first_name = struct.first_name
        last_name = struct.last_name
        gender = struct.gender
        new(external_id: external_id, date_of_birth: date_of_birth, address: address, first_name: first_name,
            last_name: last_name, gender: gender, additional_properties: struct)
      end

      # Serialize an instance of PatientBase to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "external_id": @external_id,
          "date_of_birth": @date_of_birth,
          "address": @address,
          "first_name": @first_name,
          "last_name": @last_name,
          "gender": @gender
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
        obj.date_of_birth.is_a?(String) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        Commons::StreetAddressShortZip.validate_raw(obj: obj.address)
        obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.gender.is_a?(Individual::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
      end
    end
  end
end
