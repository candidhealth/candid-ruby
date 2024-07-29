# frozen_string_literal: true

require "json"
require_relative "multiple_instances_for_schema_error"
require_relative "value_does_not_match_key_type_error"
require_relative "key_does_not_exist_error"
require_relative "schema_does_not_exist_error"
require_relative "schema_unauthorized_access_error"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class SchemaInstanceValidationError
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of SchemaInstanceValidationError
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "multiple_instances_for_schema"
                       CandidApiClient::Encounters::V4::Types::MultipleInstancesForSchemaError.from_json(json_object: json_object)
                     when "value_does_not_match_key_type"
                       CandidApiClient::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError.from_json(json_object: json_object)
                     when "key_does_not_exist"
                       CandidApiClient::Encounters::V4::Types::KeyDoesNotExistError.from_json(json_object: json_object)
                     when "schema_does_not_exist"
                       CandidApiClient::Encounters::V4::Types::SchemaDoesNotExistError.from_json(json_object: json_object)
                     when "schema_unauthorized_access"
                       CandidApiClient::Encounters::V4::Types::SchemaUnauthorizedAccessError.from_json(json_object: json_object)
                     else
                       CandidApiClient::Encounters::V4::Types::MultipleInstancesForSchemaError.from_json(json_object: json_object)
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "multiple_instances_for_schema"
              { **@member.to_json, type: @discriminant }.to_json
            when "value_does_not_match_key_type"
              { **@member.to_json, type: @discriminant }.to_json
            when "key_does_not_exist"
              { **@member.to_json, type: @discriminant }.to_json
            when "schema_does_not_exist"
              { **@member.to_json, type: @discriminant }.to_json
            when "schema_unauthorized_access"
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
            when "multiple_instances_for_schema"
              CandidApiClient::Encounters::V4::Types::MultipleInstancesForSchemaError.validate_raw(obj: obj)
            when "value_does_not_match_key_type"
              CandidApiClient::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError.validate_raw(obj: obj)
            when "key_does_not_exist"
              CandidApiClient::Encounters::V4::Types::KeyDoesNotExistError.validate_raw(obj: obj)
            when "schema_does_not_exist"
              CandidApiClient::Encounters::V4::Types::SchemaDoesNotExistError.validate_raw(obj: obj)
            when "schema_unauthorized_access"
              CandidApiClient::Encounters::V4::Types::SchemaUnauthorizedAccessError.validate_raw(obj: obj)
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

          # @param member [CandidApiClient::Encounters::V4::Types::MultipleInstancesForSchemaError]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.multiple_instances_for_schema(member:)
            new(member: member, discriminant: "multiple_instances_for_schema")
          end

          # @param member [CandidApiClient::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.value_does_not_match_key_type(member:)
            new(member: member, discriminant: "value_does_not_match_key_type")
          end

          # @param member [CandidApiClient::Encounters::V4::Types::KeyDoesNotExistError]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.key_does_not_exist(member:)
            new(member: member, discriminant: "key_does_not_exist")
          end

          # @param member [CandidApiClient::Encounters::V4::Types::SchemaDoesNotExistError]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.schema_does_not_exist(member:)
            new(member: member, discriminant: "schema_does_not_exist")
          end

          # @param member [CandidApiClient::Encounters::V4::Types::SchemaUnauthorizedAccessError]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError]
          def self.schema_unauthorized_access(member:)
            new(member: member, discriminant: "schema_unauthorized_access")
          end
        end
      end
    end
  end
end
