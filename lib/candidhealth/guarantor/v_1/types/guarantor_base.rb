# frozen_string_literal: true

require "date"
require_relative "../../../commons/types/street_address_short_zip"
require "ostruct"
require "json"

module CandidApiClient
  module Guarantor
    module V1
      module Types
        class GuarantorBase
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

          # @param first_name [String]
          # @param last_name [String]
          # @param external_id [String]
          # @param date_of_birth [Date]
          # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Guarantor::V1::Types::GuarantorBase]
          def initialize(first_name:, last_name:, external_id:, date_of_birth: OMIT, address: OMIT,
                         additional_properties: nil)
            @first_name = first_name
            @last_name = last_name
            @external_id = external_id
            @date_of_birth = date_of_birth if date_of_birth != OMIT
            @address = address if address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "first_name": first_name,
              "last_name": last_name,
              "external_id": external_id,
              "date_of_birth": date_of_birth,
              "address": address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of GuarantorBase
          #
          # @param json_object [String]
          # @return [CandidApiClient::Guarantor::V1::Types::GuarantorBase]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
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
              first_name: first_name,
              last_name: last_name,
              external_id: external_id,
              date_of_birth: date_of_birth,
              address: address,
              additional_properties: struct
            )
          end

          # Serialize an instance of GuarantorBase to a JSON object
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
