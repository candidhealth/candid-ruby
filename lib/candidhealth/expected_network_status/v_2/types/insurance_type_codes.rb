# frozen_string_literal: true

require "json"
require_relative "../../../commons/types/insurance_type_code"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class InsuranceTypeCodes
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of InsuranceTypeCodes
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "insurance_type_code"
                     json_object.value
                   when "unknown_insurance_type_code"
                     nil
                   when "not_applicable"
                     nil
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
          when "insurance_type_code"
            { "type": @discriminant, "value": @member }.to_json
          when "unknown_insurance_type_code"
            { type: @discriminant }.to_json
          when "not_applicable"
            { type: @discriminant }.to_json
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
          when "insurance_type_code"
            obj.is_a?(Commons::InsuranceTypeCode) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          when "unknown_insurance_type_code"
            # noop
          when "not_applicable"
            # noop
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

        # @param member [Commons::InsuranceTypeCode]
        # @return [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        def self.insurance_type_code(member:)
          new(member: member, discriminant: "insurance_type_code")
        end

        # @return [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        def self.unknown_insurance_type_code
          new(member: nil, discriminant: "unknown_insurance_type_code")
        end

        # @return [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        def self.not_applicable
          new(member: nil, discriminant: "not_applicable")
        end
      end
    end
  end
end
