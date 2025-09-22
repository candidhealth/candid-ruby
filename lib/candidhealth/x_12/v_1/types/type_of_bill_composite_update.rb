# frozen_string_literal: true

require "json"
require_relative "type_of_bill_composite_base"

module CandidApiClient
  module X12
    module V1
      module Types
        # A type of bill can either be seen as a compositio of structured parts, or as a
        #  literal string.
        #  This union represents the potential to express a type of bill either as one of
        #  those two shapes.
        #  Passing a string, this update will be seen as a complete 4 digit code, along
        #  with a padding code 0, that
        #  should match a valid composition.
        #  Passing as a structure, the update will be seen as three parts and will be
        #  joined together by the server
        #  to represent a valid composition for you.
        #  Which you use depends upon whether you are "passing through" coded information
        #  or making a decision about its
        #  structure explicitly.
        class TypeOfBillCompositeUpdate
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of TypeOfBillCompositeUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "raw_code"
                       json_object.value
                     when "composite_codes"
                       CandidApiClient::X12::V1::Types::TypeOfBillCompositeBase.from_json(json_object: json_object)
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
            when "raw_code"
              { "type": @discriminant, "value": @member }.to_json
            when "composite_codes"
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
            when "raw_code"
              obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
            when "composite_codes"
              CandidApiClient::X12::V1::Types::TypeOfBillCompositeBase.validate_raw(obj: obj)
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

          # @param member [String]
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate]
          def self.raw_code(member:)
            new(member: member, discriminant: "raw_code")
          end

          # @param member [CandidApiClient::X12::V1::Types::TypeOfBillCompositeBase]
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeUpdate]
          def self.composite_codes(member:)
            new(member: member, discriminant: "composite_codes")
          end
        end
      end
    end
  end
end
