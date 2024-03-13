# frozen_string_literal: true

require "json"
require_relative "payer_info"
require_relative "payer_uuid"

module CandidApiClient
  module Payers
    module V3
      class PayerIdentifier
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [Payers::V3::PayerIdentifier]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of PayerIdentifier
        #
        # @param json_object [JSON]
        # @return [Payers::V3::PayerIdentifier]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "payer_info"
                     Payers::V3::PayerInfo.from_json(json_object: json_object)
                   when "payer_uuid"
                     json_object.value
                   else
                     Payers::V3::PayerInfo.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
        def to_json(*_args)
          case @discriminant
          when "payer_info"
            { **@member.to_json, type: @discriminant }.to_json
          when "payer_uuid"
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
          when "payer_info"
            Payers::V3::PayerInfo.validate_raw(obj: obj)
          when "payer_uuid"
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

        # @param member [Payers::V3::PayerInfo]
        # @return [Payers::V3::PayerIdentifier]
        def self.payer_info(member:)
          new(member: member, discriminant: "payer_info")
        end

        # @param member [Payers::V3::PAYER_String]
        # @return [Payers::V3::PayerIdentifier]
        def self.payer_uuid(member:)
          new(member: member, discriminant: "payer_uuid")
        end
      end
    end
  end
end
