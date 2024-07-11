# frozen_string_literal: true

require_relative "payee_identifier"
require "ostruct"
require "json"

module CandidApiClient
  module Remits
    module V1
      module Types
        class Payee
          # @return [String]
          attr_reader :payee_name
          # @return [CandidApiClient::Remits::V1::Types::PayeeIdentifier]
          attr_reader :payee_identifier
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payee_name [String]
          # @param payee_identifier [CandidApiClient::Remits::V1::Types::PayeeIdentifier]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Remits::V1::Types::Payee]
          def initialize(payee_name:, payee_identifier:, additional_properties: nil)
            @payee_name = payee_name
            @payee_identifier = payee_identifier
            @additional_properties = additional_properties
            @_field_set = { "payee_name": payee_name, "payee_identifier": payee_identifier }
          end

          # Deserialize a JSON object to an instance of Payee
          #
          # @param json_object [String]
          # @return [CandidApiClient::Remits::V1::Types::Payee]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payee_name = struct["payee_name"]
            if parsed_json["payee_identifier"].nil?
              payee_identifier = nil
            else
              payee_identifier = parsed_json["payee_identifier"].to_json
              payee_identifier = CandidApiClient::Remits::V1::Types::PayeeIdentifier.from_json(json_object: payee_identifier)
            end
            new(
              payee_name: payee_name,
              payee_identifier: payee_identifier,
              additional_properties: struct
            )
          end

          # Serialize an instance of Payee to a JSON object
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
            obj.payee_name.is_a?(String) != false || raise("Passed value for field obj.payee_name is not the expected type, validation failed.")
            CandidApiClient::Remits::V1::Types::PayeeIdentifier.validate_raw(obj: obj.payee_identifier)
          end
        end
      end
    end
  end
end
