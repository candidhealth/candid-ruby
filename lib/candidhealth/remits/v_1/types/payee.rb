# frozen_string_literal: true

require_relative "payee_identifier"
require "json"

module CandidApiClient
  module Remits
    module V1
      class Payee
        attr_reader :payee_name, :payee_identifier, :additional_properties

        # @param payee_name [String]
        # @param payee_identifier [Remits::V1::PayeeIdentifier]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Remits::V1::Payee]
        def initialize(payee_name:, payee_identifier:, additional_properties: nil)
          # @type [String]
          @payee_name = payee_name
          # @type [Remits::V1::PayeeIdentifier]
          @payee_identifier = payee_identifier
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Payee
        #
        # @param json_object [JSON]
        # @return [Remits::V1::Payee]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          payee_name = struct.payee_name
          if parsed_json["payee_identifier"].nil?
            payee_identifier = nil
          else
            payee_identifier = parsed_json["payee_identifier"].to_json
            payee_identifier = Remits::V1::PayeeIdentifier.from_json(json_object: payee_identifier)
          end
          new(payee_name: payee_name, payee_identifier: payee_identifier, additional_properties: struct)
        end

        # Serialize an instance of Payee to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "payee_name": @payee_name, "payee_identifier": @payee_identifier }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payee_name.is_a?(String) != false || raise("Passed value for field obj.payee_name is not the expected type, validation failed.")
          Remits::V1::PayeeIdentifier.validate_raw(obj: obj.payee_identifier)
        end
      end
    end
  end
end
