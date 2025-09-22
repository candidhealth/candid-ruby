# frozen_string_literal: true

require "date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "gender"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientBase
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

        # @param external_id [String] The ID used to identify this individual in your system. For example, your
        #  internal patient ID or an EHR patient ID.
        # @param date_of_birth [Date] Box 3 on the CMS-1500 claim form or Form Locator 10 on a UB-04 claim form. The
        #  date format should be in ISO 8601 date; formatted YYYY-MM-DD (i.e. 2012-02-01)
        # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip] Box 5 on the CMS-1500 claim form or Form Locator 9 on a UB-04 claim form.
        # @param first_name [String]
        # @param last_name [String]
        # @param gender [CandidApiClient::Individual::Types::Gender]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientBase]
        def initialize(external_id:, date_of_birth:, address:, first_name:, last_name:, gender:,
                       additional_properties: nil)
          @external_id = external_id
          @date_of_birth = date_of_birth
          @address = address
          @first_name = first_name
          @last_name = last_name
          @gender = gender
          @additional_properties = additional_properties
          @_field_set = {
            "external_id": external_id,
            "date_of_birth": date_of_birth,
            "address": address,
            "first_name": first_name,
            "last_name": last_name,
            "gender": gender
          }
        end

        # Deserialize a JSON object to an instance of PatientBase
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
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
            external_id: external_id,
            date_of_birth: date_of_birth,
            address: address,
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientBase to a JSON object
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
