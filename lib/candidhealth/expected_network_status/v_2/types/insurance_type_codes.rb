# frozen_string_literal: true

require "json"
require_relative "empty_object"
require_relative "../../../commons/types/insurance_type_code"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class InsuranceTypeCodes
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of InsuranceTypeCodes
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "insurance_type_code"
                       json_object.value
                     when "unknown_insurance_type_code"
                       CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject.from_json(json_object: json_object)
                     when "not_applicable"
                       CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject.from_json(json_object: json_object)
                     else
                       json_object
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "insurance_type_code"
              { "type": @discriminant, "value": @member }.to_json
            when "unknown_insurance_type_code"
              { **@member.to_json, type: @discriminant }.to_json
            when "not_applicable"
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
            when "insurance_type_code"
              obj.is_a?(CandidApiClient::Commons::Types::InsuranceTypeCode) != false || raise("Passed value for field obj is not the expected type, validation failed.")
            when "unknown_insurance_type_code"
              CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject.validate_raw(obj: obj)
            when "not_applicable"
              CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject.validate_raw(obj: obj)
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

          # @param member [CandidApiClient::Commons::Types::InsuranceTypeCode]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          def self.insurance_type_code(member:)
            new(member: member, discriminant: "insurance_type_code")
          end

          # @param member [CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          def self.unknown_insurance_type_code(member:)
            new(member: member, discriminant: "unknown_insurance_type_code")
          end

          # @param member [CandidApiClient::ExpectedNetworkStatus::V2::Types::EmptyObject]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          def self.not_applicable(member:)
            new(member: member, discriminant: "not_applicable")
          end
        end
      end
    end
  end
end
