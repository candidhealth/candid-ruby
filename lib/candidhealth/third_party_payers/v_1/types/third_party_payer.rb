# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ThirdPartyPayers
    module V1
      module Types
        class ThirdPartyPayer
          # @return [String]
          attr_reader :third_party_payer_id
          # @return [String]
          attr_reader :name
          # @return [String]
          attr_reader :description
          # @return [String]
          attr_reader :category
          # @return [Boolean]
          attr_reader :enabled
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param third_party_payer_id [String]
          # @param name [String]
          # @param description [String]
          # @param category [String]
          # @param enabled [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
          def initialize(third_party_payer_id:, name:, enabled:, description: OMIT, category: OMIT,
                         additional_properties: nil)
            @third_party_payer_id = third_party_payer_id
            @name = name
            @description = description if description != OMIT
            @category = category if category != OMIT
            @enabled = enabled
            @additional_properties = additional_properties
            @_field_set = {
              "third_party_payer_id": third_party_payer_id,
              "name": name,
              "description": description,
              "category": category,
              "enabled": enabled
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ThirdPartyPayer
          #
          # @param json_object [String]
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            third_party_payer_id = struct["third_party_payer_id"]
            name = struct["name"]
            description = struct["description"]
            category = struct["category"]
            enabled = struct["enabled"]
            new(
              third_party_payer_id: third_party_payer_id,
              name: name,
              description: description,
              category: category,
              enabled: enabled,
              additional_properties: struct
            )
          end

          # Serialize an instance of ThirdPartyPayer to a JSON object
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
            obj.third_party_payer_id.is_a?(String) != false || raise("Passed value for field obj.third_party_payer_id is not the expected type, validation failed.")
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.category&.is_a?(String) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
