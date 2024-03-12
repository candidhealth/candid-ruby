# frozen_string_literal: true

require_relative "state"
require "json"

module CandidApiClient
  class Commons
    class StreetAddressShortZip
      attr_reader :zip_plus_four_code, :address_1, :address_2, :city, :state, :zip_code, :additional_properties

      # @param zip_plus_four_code [String] 4-digit zip add-on code https://en.wikipedia.org/wiki/ZIP_Code#ZIP+4
      # @param address_1 [String]
      # @param address_2 [String]
      # @param city [String]
      # @param state [Commons::State]
      # @param zip_code [String] 5-digit zip code
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::StreetAddressShortZip]
      def initialize(address_1:, city:, state:, zip_code:, zip_plus_four_code: nil, address_2: nil,
                     additional_properties: nil)
        # @type [String] 4-digit zip add-on code https://en.wikipedia.org/wiki/ZIP_Code#ZIP+4
        @zip_plus_four_code = zip_plus_four_code
        # @type [String]
        @address_1 = address_1
        # @type [String]
        @address_2 = address_2
        # @type [String]
        @city = city
        # @type [Commons::State]
        @state = state
        # @type [String] 5-digit zip code
        @zip_code = zip_code
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of StreetAddressShortZip
      #
      # @param json_object [JSON]
      # @return [Commons::StreetAddressShortZip]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        zip_plus_four_code = struct.zip_plus_four_code
        address_1 = struct.address1
        address_2 = struct.address2
        city = struct.city
        state = struct.state
        zip_code = struct.zip_code
        new(zip_plus_four_code: zip_plus_four_code, address_1: address_1, address_2: address_2, city: city,
            state: state, zip_code: zip_code, additional_properties: struct)
      end

      # Serialize an instance of StreetAddressShortZip to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "zip_plus_four_code": @zip_plus_four_code,
          "address1": @address_1,
          "address2": @address_2,
          "city": @city,
          "state": @state,
          "zip_code": @zip_code
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.zip_plus_four_code&.is_a?(String) != false || raise("Passed value for field obj.zip_plus_four_code is not the expected type, validation failed.")
        obj.address_1.is_a?(String) != false || raise("Passed value for field obj.address_1 is not the expected type, validation failed.")
        obj.address_2&.is_a?(String) != false || raise("Passed value for field obj.address_2 is not the expected type, validation failed.")
        obj.city.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
        obj.state.is_a?(Commons::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.zip_code.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
      end
    end
  end
end
