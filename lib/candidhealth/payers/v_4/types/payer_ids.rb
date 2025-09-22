# frozen_string_literal: true

require_relative "support_state"
require "ostruct"
require "json"

module CandidApiClient
  module Payers
    module V4
      module Types
        class PayerIds
          # @return [String] The payer ID for claim submission
          attr_reader :claims_payer_id
          # @return [String] The payer ID for eligibility
          attr_reader :eligibility_payer_id
          # @return [String] The payer ID for remittance
          attr_reader :remittance_payer_id
          # @return [CandidApiClient::Payers::V4::Types::SupportState] The support state for claims submission
          attr_reader :claims_support
          # @return [CandidApiClient::Payers::V4::Types::SupportState] The support state for eligibility
          attr_reader :eligibility_support
          # @return [CandidApiClient::Payers::V4::Types::SupportState] The support state for remittance
          attr_reader :remittance_support
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claims_payer_id [String] The payer ID for claim submission
          # @param eligibility_payer_id [String] The payer ID for eligibility
          # @param remittance_payer_id [String] The payer ID for remittance
          # @param claims_support [CandidApiClient::Payers::V4::Types::SupportState] The support state for claims submission
          # @param eligibility_support [CandidApiClient::Payers::V4::Types::SupportState] The support state for eligibility
          # @param remittance_support [CandidApiClient::Payers::V4::Types::SupportState] The support state for remittance
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Payers::V4::Types::PayerIds]
          def initialize(claims_payer_id:, eligibility_payer_id:, remittance_payer_id:, claims_support:,
                         eligibility_support:, remittance_support:, additional_properties: nil)
            @claims_payer_id = claims_payer_id
            @eligibility_payer_id = eligibility_payer_id
            @remittance_payer_id = remittance_payer_id
            @claims_support = claims_support
            @eligibility_support = eligibility_support
            @remittance_support = remittance_support
            @additional_properties = additional_properties
            @_field_set = {
              "claims_payer_id": claims_payer_id,
              "eligibility_payer_id": eligibility_payer_id,
              "remittance_payer_id": remittance_payer_id,
              "claims_support": claims_support,
              "eligibility_support": eligibility_support,
              "remittance_support": remittance_support
            }
          end

          # Deserialize a JSON object to an instance of PayerIds
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V4::Types::PayerIds]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            claims_payer_id = struct["claims_payer_id"]
            eligibility_payer_id = struct["eligibility_payer_id"]
            remittance_payer_id = struct["remittance_payer_id"]
            claims_support = struct["claims_support"]
            eligibility_support = struct["eligibility_support"]
            remittance_support = struct["remittance_support"]
            new(
              claims_payer_id: claims_payer_id,
              eligibility_payer_id: eligibility_payer_id,
              remittance_payer_id: remittance_payer_id,
              claims_support: claims_support,
              eligibility_support: eligibility_support,
              remittance_support: remittance_support,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerIds to a JSON object
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
            obj.claims_payer_id.is_a?(String) != false || raise("Passed value for field obj.claims_payer_id is not the expected type, validation failed.")
            obj.eligibility_payer_id.is_a?(String) != false || raise("Passed value for field obj.eligibility_payer_id is not the expected type, validation failed.")
            obj.remittance_payer_id.is_a?(String) != false || raise("Passed value for field obj.remittance_payer_id is not the expected type, validation failed.")
            obj.claims_support.is_a?(CandidApiClient::Payers::V4::Types::SupportState) != false || raise("Passed value for field obj.claims_support is not the expected type, validation failed.")
            obj.eligibility_support.is_a?(CandidApiClient::Payers::V4::Types::SupportState) != false || raise("Passed value for field obj.eligibility_support is not the expected type, validation failed.")
            obj.remittance_support.is_a?(CandidApiClient::Payers::V4::Types::SupportState) != false || raise("Passed value for field obj.remittance_support is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
