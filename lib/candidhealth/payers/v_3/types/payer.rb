# frozen_string_literal: true

require_relative "../../../commons/types/street_address_long_zip"
require "ostruct"
require "json"

module CandidApiClient
  module Payers
    module V3
      module Types
        class Payer
          # @return [String] Auto-generated ID set on creation.
          attr_reader :payer_uuid
          # @return [String] The primary national payer ID of the payer.
          attr_reader :payer_id
          # @return [String] The primary display name of the payer.
          attr_reader :payer_name
          # @return [String] The name of the payer as it appears in Availity.
          attr_reader :availity_payer_name
          # @return [String] The ID of the payer as it appears in Availity.
          attr_reader :availity_claims_payer_id
          # @return [String] The eligibility ID of the payer as it appears in Availity.
          attr_reader :availity_eligibility_id
          # @return [String] The remittance ID of the payer as it appears in Availity.
          attr_reader :availity_remittance_payer_id
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip]
          attr_reader :street_address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_uuid [String] Auto-generated ID set on creation.
          # @param payer_id [String] The primary national payer ID of the payer.
          # @param payer_name [String] The primary display name of the payer.
          # @param availity_payer_name [String] The name of the payer as it appears in Availity.
          # @param availity_claims_payer_id [String] The ID of the payer as it appears in Availity.
          # @param availity_eligibility_id [String] The eligibility ID of the payer as it appears in Availity.
          # @param availity_remittance_payer_id [String] The remittance ID of the payer as it appears in Availity.
          # @param street_address [CandidApiClient::Commons::Types::StreetAddressLongZip]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          def initialize(payer_uuid:, payer_id:, payer_name:, availity_payer_name: OMIT,
                         availity_claims_payer_id: OMIT, availity_eligibility_id: OMIT, availity_remittance_payer_id: OMIT, street_address: OMIT, additional_properties: nil)
            @payer_uuid = payer_uuid
            @payer_id = payer_id
            @payer_name = payer_name
            @availity_payer_name = availity_payer_name if availity_payer_name != OMIT
            @availity_claims_payer_id = availity_claims_payer_id if availity_claims_payer_id != OMIT
            @availity_eligibility_id = availity_eligibility_id if availity_eligibility_id != OMIT
            @availity_remittance_payer_id = availity_remittance_payer_id if availity_remittance_payer_id != OMIT
            @street_address = street_address if street_address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "payer_uuid": payer_uuid,
              "payer_id": payer_id,
              "payer_name": payer_name,
              "availity_payer_name": availity_payer_name,
              "availity_claims_payer_id": availity_claims_payer_id,
              "availity_eligibility_id": availity_eligibility_id,
              "availity_remittance_payer_id": availity_remittance_payer_id,
              "street_address": street_address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Payer
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_uuid = struct["payer_uuid"]
            payer_id = struct["payer_id"]
            payer_name = struct["payer_name"]
            availity_payer_name = struct["availity_payer_name"]
            availity_claims_payer_id = struct["availity_claims_payer_id"]
            availity_eligibility_id = struct["availity_eligibility_id"]
            availity_remittance_payer_id = struct["availity_remittance_payer_id"]
            if parsed_json["street_address"].nil?
              street_address = nil
            else
              street_address = parsed_json["street_address"].to_json
              street_address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: street_address)
            end
            new(
              payer_uuid: payer_uuid,
              payer_id: payer_id,
              payer_name: payer_name,
              availity_payer_name: availity_payer_name,
              availity_claims_payer_id: availity_claims_payer_id,
              availity_eligibility_id: availity_eligibility_id,
              availity_remittance_payer_id: availity_remittance_payer_id,
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
            obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
            obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
            obj.availity_payer_name&.is_a?(String) != false || raise("Passed value for field obj.availity_payer_name is not the expected type, validation failed.")
            obj.availity_claims_payer_id&.is_a?(String) != false || raise("Passed value for field obj.availity_claims_payer_id is not the expected type, validation failed.")
            obj.availity_eligibility_id&.is_a?(String) != false || raise("Passed value for field obj.availity_eligibility_id is not the expected type, validation failed.")
            obj.availity_remittance_payer_id&.is_a?(String) != false || raise("Passed value for field obj.availity_remittance_payer_id is not the expected type, validation failed.")
            obj.street_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.street_address)
          end
        end
      end
    end
  end
end
