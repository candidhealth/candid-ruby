# frozen_string_literal: true

require_relative "payer_ids"
require "ostruct"
require "json"

module CandidApiClient
  module Payers
    module V4
      module Types
        class ClearinghousePayerInfo
          # @return [String] The clearinghouse display name of the payer.
          attr_reader :payer_name
          # @return [CandidApiClient::Payers::V4::Types::PayerIds] Payer IDs for professional claims
          attr_reader :professional_payer_ids
          # @return [CandidApiClient::Payers::V4::Types::PayerIds] Payer IDs for institutional claims
          attr_reader :institutional_payer_ids
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_name [String] The clearinghouse display name of the payer.
          # @param professional_payer_ids [CandidApiClient::Payers::V4::Types::PayerIds] Payer IDs for professional claims
          # @param institutional_payer_ids [CandidApiClient::Payers::V4::Types::PayerIds] Payer IDs for institutional claims
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Payers::V4::Types::ClearinghousePayerInfo]
          def initialize(payer_name:, professional_payer_ids:, institutional_payer_ids:, additional_properties: nil)
            @payer_name = payer_name
            @professional_payer_ids = professional_payer_ids
            @institutional_payer_ids = institutional_payer_ids
            @additional_properties = additional_properties
            @_field_set = {
              "payer_name": payer_name,
              "professional_payer_ids": professional_payer_ids,
              "institutional_payer_ids": institutional_payer_ids
            }
          end

          # Deserialize a JSON object to an instance of ClearinghousePayerInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V4::Types::ClearinghousePayerInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_name = struct["payer_name"]
            if parsed_json["professional_payer_ids"].nil?
              professional_payer_ids = nil
            else
              professional_payer_ids = parsed_json["professional_payer_ids"].to_json
              professional_payer_ids = CandidApiClient::Payers::V4::Types::PayerIds.from_json(json_object: professional_payer_ids)
            end
            if parsed_json["institutional_payer_ids"].nil?
              institutional_payer_ids = nil
            else
              institutional_payer_ids = parsed_json["institutional_payer_ids"].to_json
              institutional_payer_ids = CandidApiClient::Payers::V4::Types::PayerIds.from_json(json_object: institutional_payer_ids)
            end
            new(
              payer_name: payer_name,
              professional_payer_ids: professional_payer_ids,
              institutional_payer_ids: institutional_payer_ids,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClearinghousePayerInfo to a JSON object
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
            obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
            CandidApiClient::Payers::V4::Types::PayerIds.validate_raw(obj: obj.professional_payer_ids)
            CandidApiClient::Payers::V4::Types::PayerIds.validate_raw(obj: obj.institutional_payer_ids)
          end
        end
      end
    end
  end
end
