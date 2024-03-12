# frozen_string_literal: true

require "json"
require_relative "../../../commons/types/npi"
require_relative "../../../commons/types/tax_id"

module CandidApiClient
  module Remits
    module V1
      class PayeeIdentifier
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [Remits::V1::PayeeIdentifier]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of PayeeIdentifier
        #
        # @param json_object [JSON]
        # @return [Remits::V1::PayeeIdentifier]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "npi"
                     json_object.value
                   when "tin"
                     json_object.value
                   when "cms_plan_id"
                     json_object.value
                   else
                     json_object
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
        def to_json(*_args)
          case @discriminant
          when "npi"
          when "tin"
          when "cms_plan_id"
          end
          { "type": @discriminant, "value": @member }.to_json
          @member.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          case obj.type
          when "npi"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          when "tin"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          when "cms_plan_id"
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

        # @param member [Commons::NPI]
        # @return [Remits::V1::PayeeIdentifier]
        def self.npi(member:)
          new(member: member, discriminant: "npi")
        end

        # @param member [Commons::TAX_ID]
        # @return [Remits::V1::PayeeIdentifier]
        def self.tin(member:)
          new(member: member, discriminant: "tin")
        end

        # @param member [String]
        # @return [Remits::V1::PayeeIdentifier]
        def self.cms_plan_id(member:)
          new(member: member, discriminant: "cms_plan_id")
        end
      end
    end
  end
end
