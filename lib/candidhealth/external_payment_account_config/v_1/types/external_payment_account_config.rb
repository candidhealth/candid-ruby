# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ExternalPaymentAccountConfig
    module V1
      module Types
        class ExternalPaymentAccountConfig
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :account_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param account_name [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfig]
          def initialize(id:, account_name:, additional_properties: nil)
            @id = id
            @account_name = account_name
            @additional_properties = additional_properties
            @_field_set = { "id": id, "account_name": account_name }
          end

          # Deserialize a JSON object to an instance of ExternalPaymentAccountConfig
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfig]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            id = struct["id"]
            account_name = struct["account_name"]
            new(
              id: id,
              account_name: account_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExternalPaymentAccountConfig to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.account_name.is_a?(String) != false || raise("Passed value for field obj.account_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
