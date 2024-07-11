# frozen_string_literal: true

require "json"
require_relative "medicare_provider_identifier"
require_relative "medicaid_provider_identifier"

module CandidApiClient
  module Identifiers
    module Types
      class IdentifierValue
        # @return [Object]
        attr_reader :member
        # @return [String]
        attr_reader :discriminant

        private_class_method :new
        alias kind_of? is_a?

        # @param member [Object]
        # @param discriminant [String]
        # @return [CandidApiClient::Identifiers::Types::IdentifierValue]
        def initialize(member:, discriminant:)
          @member = member
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of IdentifierValue
        #
        # @param json_object [String]
        # @return [CandidApiClient::Identifiers::Types::IdentifierValue]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "medicare_provider_identifier"
                     CandidApiClient::Identifiers::Types::MedicareProviderIdentifier.from_json(json_object: json_object)
                   when "medicaid_provider_identifier"
                     CandidApiClient::Identifiers::Types::MedicaidProviderIdentifier.from_json(json_object: json_object)
                   else
                     CandidApiClient::Identifiers::Types::MedicareProviderIdentifier.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [String]
        def to_json(*_args)
          case @discriminant
          when "medicare_provider_identifier"
            { **@member.to_json, type: @discriminant }.to_json
          when "medicaid_provider_identifier"
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
          when "medicare_provider_identifier"
            CandidApiClient::Identifiers::Types::MedicareProviderIdentifier.validate_raw(obj: obj)
          when "medicaid_provider_identifier"
            CandidApiClient::Identifiers::Types::MedicaidProviderIdentifier.validate_raw(obj: obj)
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

        # @param member [CandidApiClient::Identifiers::Types::MedicareProviderIdentifier]
        # @return [CandidApiClient::Identifiers::Types::IdentifierValue]
        def self.medicare_provider_identifier(member:)
          new(member: member, discriminant: "medicare_provider_identifier")
        end

        # @param member [CandidApiClient::Identifiers::Types::MedicaidProviderIdentifier]
        # @return [CandidApiClient::Identifiers::Types::IdentifierValue]
        def self.medicaid_provider_identifier(member:)
          new(member: member, discriminant: "medicaid_provider_identifier")
        end
      end
    end
  end
end
