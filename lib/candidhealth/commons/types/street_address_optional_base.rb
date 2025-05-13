# frozen_string_literal: true

require_relative "state"
require "ostruct"
require "json"

module CandidApiClient
  module Commons
    module Types
      class StreetAddressOptionalBase
        # @return [String]
        attr_reader :address_1
        # @return [String]
        attr_reader :address_2
        # @return [String]
        attr_reader :city
        # @return [CandidApiClient::Commons::Types::State]
        attr_reader :state
        # @return [String] 5-digit zip code
        attr_reader :zip_code
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param address_1 [String]
        # @param address_2 [String]
        # @param city [String]
        # @param state [CandidApiClient::Commons::Types::State]
        # @param zip_code [String] 5-digit zip code
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Commons::Types::StreetAddressOptionalBase]
        def initialize(address_1: OMIT, address_2: OMIT, city: OMIT, state: OMIT, zip_code: OMIT,
                       additional_properties: nil)
          @address_1 = address_1 if address_1 != OMIT
          @address_2 = address_2 if address_2 != OMIT
          @city = city if city != OMIT
          @state = state if state != OMIT
          @zip_code = zip_code if zip_code != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "address1": address_1,
            "address2": address_2,
            "city": city,
            "state": state,
            "zip_code": zip_code
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of StreetAddressOptionalBase
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::StreetAddressOptionalBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          address_1 = struct["address1"]
          address_2 = struct["address2"]
          city = struct["city"]
          state = struct["state"]
          zip_code = struct["zip_code"]
          new(
            address_1: address_1,
            address_2: address_2,
            city: city,
            state: state,
            zip_code: zip_code,
            additional_properties: struct
          )
        end

        # Serialize an instance of StreetAddressOptionalBase to a JSON object
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
          obj.address_1&.is_a?(String) != false || raise("Passed value for field obj.address_1 is not the expected type, validation failed.")
          obj.address_2&.is_a?(String) != false || raise("Passed value for field obj.address_2 is not the expected type, validation failed.")
          obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
          obj.state&.is_a?(CandidApiClient::Commons::Types::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
          obj.zip_code&.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
        end
      end
    end
  end
end
