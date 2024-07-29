# frozen_string_literal: true

require "json"
require_relative "schema_with_name_already_exists_error"
require_relative "key_with_name_already_exists_error"

module CandidApiClient
  module CustomSchemas
    module V1
      module Types
        class SchemaValidationError
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of SchemaValidationError
          #
          # @param json_object [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "schema_name_already_exists"
                       CandidApiClient::CustomSchemas::V1::Types::SchemaWithNameAlreadyExistsError.from_json(json_object: json_object)
                     when "key_name_already_exists"
                       CandidApiClient::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError.from_json(json_object: json_object)
                     else
                       CandidApiClient::CustomSchemas::V1::Types::SchemaWithNameAlreadyExistsError.from_json(json_object: json_object)
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "schema_name_already_exists"
              { **@member.to_json, type: @discriminant }.to_json
            when "key_name_already_exists"
              { **@member.to_json, type: @discriminant }.to_json
            else
              { "type": @discriminant, value: @member }.to_json
            end
            @member.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            case obj.type
            when "schema_name_already_exists"
              CandidApiClient::CustomSchemas::V1::Types::SchemaWithNameAlreadyExistsError.validate_raw(obj: obj)
            when "key_name_already_exists"
              CandidApiClient::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError.validate_raw(obj: obj)
            else
              raise("Passed value matched no type within the union, validation failed.")
            end
          end

          # For Union Types, is_a? functionality is delegated to the wrapped member.
          #
          # @param obj [Object]
          # @return [Boolean]
          def is_a?(obj)
            @member.is_a?(obj)
          end

          # @param member [CandidApiClient::CustomSchemas::V1::Types::SchemaWithNameAlreadyExistsError]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError]
          def self.schema_name_already_exists(member:)
            new(member: member, discriminant: "schema_name_already_exists")
          end

          # @param member [CandidApiClient::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError]
          def self.key_name_already_exists(member:)
            new(member: member, discriminant: "key_name_already_exists")
          end
        end
      end
    end
  end
end
