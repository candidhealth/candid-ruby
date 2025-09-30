# frozen_string_literal: true

require_relative "primary_payer_ids"
require_relative "../../../commons/types/street_address_long_zip"
require "ostruct"
require "json"

module CandidApiClient
  module Payers
    module V4
      module Types
        class Payer
          # @return [String] Auto-generated ID set on creation.
          attr_reader :payer_uuid
          # @return [CandidApiClient::Payers::V4::Types::PrimaryPayerIds] The primary national payer IDs of the payer.
          attr_reader :payer_ids
          # @return [String] The primary display name of the payer.
          attr_reader :payer_name
          # @return [Hash{CandidApiClient::Commons::Types::Clearinghouse => CandidApiClient::Payers::V4::Types::ClearinghousePayerInfo}]
          attr_reader :clearinghouse_payer_info
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip]
          attr_reader :street_address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_uuid [String] Auto-generated ID set on creation.
          # @param payer_ids [CandidApiClient::Payers::V4::Types::PrimaryPayerIds] The primary national payer IDs of the payer.
          # @param payer_name [String] The primary display name of the payer.
          # @param clearinghouse_payer_info [Hash{CandidApiClient::Commons::Types::Clearinghouse => CandidApiClient::Payers::V4::Types::ClearinghousePayerInfo}]
          # @param street_address [CandidApiClient::Commons::Types::StreetAddressLongZip]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Payers::V4::Types::Payer]
          def initialize(payer_uuid:, payer_ids:, payer_name:, clearinghouse_payer_info:, street_address: OMIT,
                         additional_properties: nil)
            @payer_uuid = payer_uuid
            @payer_ids = payer_ids
            @payer_name = payer_name
            @clearinghouse_payer_info = clearinghouse_payer_info
            @street_address = street_address if street_address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "payer_uuid": payer_uuid,
              "payer_ids": payer_ids,
              "payer_name": payer_name,
              "clearinghouse_payer_info": clearinghouse_payer_info,
              "street_address": street_address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Payer
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V4::Types::Payer]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_uuid = struct["payer_uuid"]
            if parsed_json["payer_ids"].nil?
              payer_ids = nil
            else
              payer_ids = parsed_json["payer_ids"].to_json
              payer_ids = CandidApiClient::Payers::V4::Types::PrimaryPayerIds.from_json(json_object: payer_ids)
            end
            payer_name = struct["payer_name"]
            clearinghouse_payer_info = parsed_json["clearinghouse_payer_info"]&.transform_values do |value|
              value = value.to_json
              CandidApiClient::Payers::V4::Types::ClearinghousePayerInfo.from_json(json_object: value)
            end
            if parsed_json["street_address"].nil?
              street_address = nil
            else
              street_address = parsed_json["street_address"].to_json
              street_address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: street_address)
            end
            new(
              payer_uuid: payer_uuid,
              payer_ids: payer_ids,
              payer_name: payer_name,
              clearinghouse_payer_info: clearinghouse_payer_info,
              street_address: street_address,
              additional_properties: struct
            )
          end

          # Serialize an instance of Payer to a JSON object
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
            obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            CandidApiClient::Payers::V4::Types::PrimaryPayerIds.validate_raw(obj: obj.payer_ids)
            obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
            obj.clearinghouse_payer_info.is_a?(Hash) != false || raise("Passed value for field obj.clearinghouse_payer_info is not the expected type, validation failed.")
            obj.street_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.street_address)
          end
        end
      end
    end
  end
end
