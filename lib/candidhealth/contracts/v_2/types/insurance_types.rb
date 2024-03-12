# frozen_string_literal: true

require "json"
require "set"

module CandidApiClient
  module Contracts
    module V2
      class InsuranceTypes
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [Contracts::V2::InsuranceTypes]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of InsuranceTypes
        #
        # @param json_object [JSON]
        # @return [Contracts::V2::InsuranceTypes]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "allApply"
                     nil
                   when "noneApply"
                     nil
                   when "theseApply"
                     Set.new(json_object.value)
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
          when "allApply"
            { type: @discriminant }.to_json
          when "noneApply"
            { type: @discriminant }.to_json
          when "theseApply"
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
          when "allApply"
            # noop
          when "noneApply"
            # noop
          when "theseApply"
            obj.is_a?(Set) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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

        # @return [Contracts::V2::InsuranceTypes]
        def self.all_apply
          new(member: nil, discriminant: "allApply")
        end

        # @return [Contracts::V2::InsuranceTypes]
        def self.none_apply
          new(member: nil, discriminant: "noneApply")
        end

        # @param member [Set<Commons::InsuranceTypeCode>]
        # @return [Contracts::V2::InsuranceTypes]
        def self.these_apply(member:)
          new(member: member, discriminant: "theseApply")
        end
      end
    end
  end
end
