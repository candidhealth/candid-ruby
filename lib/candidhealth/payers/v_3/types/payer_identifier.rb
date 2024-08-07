# frozen_string_literal: true

require "json"
require_relative "payer_info"

module CandidApiClient
  module Payers
    module V3
      module Types
        class PayerIdentifier
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of PayerIdentifier
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "payer_info"
                       CandidApiClient::Payers::V3::Types::PayerInfo.from_json(json_object: json_object)
                     when "payer_uuid"
                       json_object.value
                     else
                       CandidApiClient::Payers::V3::Types::PayerInfo.from_json(json_object: json_object)
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
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

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            case obj.type
            when "payer_info"
              CandidApiClient::Payers::V3::Types::PayerInfo.validate_raw(obj: obj)
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

          # @param member [CandidApiClient::Payers::V3::Types::PayerInfo]
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          def self.payer_info(member:)
            new(member: member, discriminant: "payer_info")
          end

          # @param member [String]
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          def self.payer_uuid(member:)
            new(member: member, discriminant: "payer_uuid")
          end
        end
      end
    end
  end
end
