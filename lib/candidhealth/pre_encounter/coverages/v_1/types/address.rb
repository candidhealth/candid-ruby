# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class Address
            # @return [String]
            attr_reader :address_1
            # @return [String]
            attr_reader :address_2
            # @return [String]
            attr_reader :city
            # @return [String]
            attr_reader :state
            # @return [String]
            attr_reader :postal_code
            # @return [String]
            attr_reader :country_code
            # @return [String]
            attr_reader :country_sub_division_code
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param address_1 [String]
            # @param address_2 [String]
            # @param city [String]
            # @param state [String]
            # @param postal_code [String]
            # @param country_code [String]
            # @param country_sub_division_code [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Address]
            def initialize(address_1: OMIT, address_2: OMIT, city: OMIT, state: OMIT, postal_code: OMIT,
                           country_code: OMIT, country_sub_division_code: OMIT, additional_properties: nil)
              @address_1 = address_1 if address_1 != OMIT
              @address_2 = address_2 if address_2 != OMIT
              @city = city if city != OMIT
              @state = state if state != OMIT
              @postal_code = postal_code if postal_code != OMIT
              @country_code = country_code if country_code != OMIT
              @country_sub_division_code = country_sub_division_code if country_sub_division_code != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "address1": address_1,
                "address2": address_2,
                "city": city,
                "state": state,
                "postal_code": postal_code,
                "country_code": country_code,
                "country_sub_division_code": country_sub_division_code
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Address
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Address]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              address_1 = struct["address1"]
              address_2 = struct["address2"]
              city = struct["city"]
              state = struct["state"]
              postal_code = struct["postal_code"]
              country_code = struct["country_code"]
              country_sub_division_code = struct["country_sub_division_code"]
              new(
                address_1: address_1,
                address_2: address_2,
                city: city,
                state: state,
                postal_code: postal_code,
                country_code: country_code,
                country_sub_division_code: country_sub_division_code,
                additional_properties: struct
              )
            end

            # Serialize an instance of Address to a JSON object
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
              obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
              obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
              obj.country_code&.is_a?(String) != false || raise("Passed value for field obj.country_code is not the expected type, validation failed.")
              obj.country_sub_division_code&.is_a?(String) != false || raise("Passed value for field obj.country_sub_division_code is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
