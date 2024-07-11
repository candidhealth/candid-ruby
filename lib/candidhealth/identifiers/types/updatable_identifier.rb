# frozen_string_literal: true

require "json"
require_relative "identifier_create"
require_relative "identifier_update"

module CandidApiClient
  module Identifiers
    module Types
      class UpdatableIdentifier
        # @return [Object]
        attr_reader :member
        # @return [String]
        attr_reader :discriminant

        private_class_method :new
        alias kind_of? is_a?

        # @param member [Object]
        # @param discriminant [String]
        # @return [CandidApiClient::Identifiers::Types::UpdatableIdentifier]
        def initialize(member:, discriminant:)
          @member = member
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of UpdatableIdentifier
        #
        # @param json_object [String]
        # @return [CandidApiClient::Identifiers::Types::UpdatableIdentifier]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "add"
                     CandidApiClient::Identifiers::Types::IdentifierCreate.from_json(json_object: json_object)
                   when "update"
                     CandidApiClient::Identifiers::Types::IdentifierUpdate.from_json(json_object: json_object)
                   when "remove"
                     json_object.value
                   else
                     CandidApiClient::Identifiers::Types::IdentifierCreate.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [String]
        def to_json(*_args)
          case @discriminant
          when "add"
            { **@member.to_json, type: @discriminant }.to_json
          when "update"
            { **@member.to_json, type: @discriminant }.to_json
          when "remove"
            { "type": @discriminant, "value": @member }.to_json
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
          when "add"
            CandidApiClient::Identifiers::Types::IdentifierCreate.validate_raw(obj: obj)
          when "update"
            CandidApiClient::Identifiers::Types::IdentifierUpdate.validate_raw(obj: obj)
          when "remove"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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

        # @param member [CandidApiClient::Identifiers::Types::IdentifierCreate]
        # @return [CandidApiClient::Identifiers::Types::UpdatableIdentifier]
        def self.add(member:)
          new(member: member, discriminant: "add")
        end

        # @param member [CandidApiClient::Identifiers::Types::IdentifierUpdate]
        # @return [CandidApiClient::Identifiers::Types::UpdatableIdentifier]
        def self.update(member:)
          new(member: member, discriminant: "update")
        end

        # @param member [String]
        # @return [CandidApiClient::Identifiers::Types::UpdatableIdentifier]
        def self.remove(member:)
          new(member: member, discriminant: "remove")
        end
      end
    end
  end
end
