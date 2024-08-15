# frozen_string_literal: true

require_relative "third_party_payer_description_update"
require_relative "third_party_payer_category_update"
require "ostruct"
require "json"

module CandidApiClient
  module ThirdPartyPayers
    module V1
      module Types
        class ThirdPartyPayerUpdateRequest
          # @return [String] Max 50 characters allowed
          attr_reader :name
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerDescriptionUpdate]
          attr_reader :description
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerCategoryUpdate]
          attr_reader :category
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String] Max 50 characters allowed
          # @param description [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerDescriptionUpdate]
          # @param category [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerCategoryUpdate]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerUpdateRequest]
          def initialize(name: OMIT, description: OMIT, category: OMIT, additional_properties: nil)
            @name = name if name != OMIT
            @description = description if description != OMIT
            @category = category if category != OMIT
            @additional_properties = additional_properties
            @_field_set = { "name": name, "description": description, "category": category }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ThirdPartyPayerUpdateRequest
          #
          # @param json_object [String]
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerUpdateRequest]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            name = struct["name"]
            if parsed_json["description"].nil?
              description = nil
            else
              description = parsed_json["description"].to_json
              description = CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerDescriptionUpdate.from_json(json_object: description)
            end
            if parsed_json["category"].nil?
              category = nil
            else
              category = parsed_json["category"].to_json
              category = CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerCategoryUpdate.from_json(json_object: category)
            end
            new(
              name: name,
              description: description,
              category: category,
              additional_properties: struct
            )
          end

          # Serialize an instance of ThirdPartyPayerUpdateRequest to a JSON object
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
            obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description.nil? || CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerDescriptionUpdate.validate_raw(obj: obj.description)
            obj.category.nil? || CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayerCategoryUpdate.validate_raw(obj: obj.category)
          end
        end
      end
    end
  end
end
