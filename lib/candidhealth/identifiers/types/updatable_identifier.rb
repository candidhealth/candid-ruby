# frozen_string_literal: true

require "json"
require_relative "identifier_create"
require_relative "identifier_update"
require_relative "identifier_id"

module CandidApiClient
  class Identifiers
    class UpdatableIdentifier
      attr_reader :member, :discriminant

      private_class_method :new
      alias kind_of? is_a?
      # @param member [Object]
      # @param discriminant [String]
      # @return [Identifiers::UpdatableIdentifier]
      def initialize(member:, discriminant:)
        # @type [Object]
        @member = member
        # @type [String]
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of UpdatableIdentifier
      #
      # @param json_object [JSON]
      # @return [Identifiers::UpdatableIdentifier]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "add"
                   Identifiers::IdentifierCreate.from_json(json_object: json_object)
                 when "update"
                   Identifiers::IdentifierUpdate.from_json(json_object: json_object)
                 when "remove"
                   json_object.value
                 else
                   Identifiers::IdentifierCreate.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
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

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "add"
          Identifiers::IdentifierCreate.validate_raw(obj: obj)
        when "update"
          Identifiers::IdentifierUpdate.validate_raw(obj: obj)
        when "remove"
          obj.is_a?(UUID) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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

      # @param member [Identifiers::IdentifierCreate]
      # @return [Identifiers::UpdatableIdentifier]
      def self.add(member:)
        new(member: member, discriminant: "add")
      end

      # @param member [Identifiers::IdentifierUpdate]
      # @return [Identifiers::UpdatableIdentifier]
      def self.update(member:)
        new(member: member, discriminant: "update")
      end

      # @param member [Identifiers::IDENTIFIER_ID]
      # @return [Identifiers::UpdatableIdentifier]
      def self.remove(member:)
        new(member: member, discriminant: "remove")
      end
    end
  end
end
