# frozen_string_literal: true

require_relative "../../../commons/types/street_address_short_zip"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayers
    module V1
      module Types
        class CreateNonInsurancePayerRequest
          # @return [String] Max 50 characters allowed
          attr_reader :name
          # @return [String] Max 255 characters allowed
          attr_reader :description
          # @return [String] Max 255 characters allowed
          attr_reader :category
          # @return [CandidApiClient::Commons::Types::StreetAddressShortZip]
          attr_reader :address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String] Max 50 characters allowed
          # @param description [String] Max 255 characters allowed
          # @param category [String] Max 255 characters allowed
          # @param address [CandidApiClient::Commons::Types::StreetAddressShortZip]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest]
          def initialize(name:, description: OMIT, category: OMIT, address: OMIT, additional_properties: nil)
            @name = name
            @description = description if description != OMIT
            @category = category if category != OMIT
            @address = address if address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "description": description,
              "category": category,
              "address": address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of CreateNonInsurancePayerRequest
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            name = struct["name"]
            description = struct["description"]
            category = struct["category"]
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressShortZip.from_json(json_object: address)
            end
            new(
              name: name,
              description: description,
              category: category,
              address: address,
              additional_properties: struct
            )
          end

          # Serialize an instance of CreateNonInsurancePayerRequest to a JSON object
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
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.category&.is_a?(String) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressShortZip.validate_raw(obj: obj.address)
          end
        end
      end
    end
  end
end
