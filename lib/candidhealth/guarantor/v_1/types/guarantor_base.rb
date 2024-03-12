# frozen_string_literal: true

require "date"
require_relative "../../../commons/types/street_address_short_zip"
require "json"

module CandidApiClient
  module Guarantor
    module V1
      class GuarantorBase
        attr_reader :first_name, :last_name, :external_id, :date_of_birth, :address, :additional_properties

        # @param first_name [String]
        # @param last_name [String]
        # @param external_id [String]
        # @param date_of_birth [Date]
        # @param address [Commons::StreetAddressShortZip]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Guarantor::V1::GuarantorBase]
        def initialize(first_name:, last_name:, external_id:, date_of_birth: nil, address: nil,
                       additional_properties: nil)
          # @type [String]
          @first_name = first_name
          # @type [String]
          @last_name = last_name
          # @type [String]
          @external_id = external_id
          # @type [Date]
          @date_of_birth = date_of_birth
          # @type [Commons::StreetAddressShortZip]
          @address = address
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of GuarantorBase
        #
        # @param json_object [JSON]
        # @return [Guarantor::V1::GuarantorBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          first_name = struct.first_name
          last_name = struct.last_name
          external_id = struct.external_id
          date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = Commons::StreetAddressShortZip.from_json(json_object: address)
          end
          new(first_name: first_name, last_name: last_name, external_id: external_id, date_of_birth: date_of_birth,
              address: address, additional_properties: struct)
        end

        # Serialize an instance of GuarantorBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "first_name": @first_name,
            "last_name": @last_name,
            "external_id": @external_id,
            "date_of_birth": @date_of_birth,
            "address": @address
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
          obj.address.nil? || Commons::StreetAddressShortZip.validate_raw(obj: obj.address)
        end
      end
    end
  end
end
