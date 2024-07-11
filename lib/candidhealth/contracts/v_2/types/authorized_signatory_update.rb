# frozen_string_literal: true

require "json"
require_relative "authorized_signatory"

module CandidApiClient
  module Contracts
    module V2
      module Types
        class AuthorizedSignatoryUpdate
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of AuthorizedSignatoryUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "set"
                       CandidApiClient::Contracts::V2::Types::AuthorizedSignatory.from_json(json_object: json_object)
                     when "remove"
                       nil
                     else
                       CandidApiClient::Contracts::V2::Types::AuthorizedSignatory.from_json(json_object: json_object)
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "set"
              { **@member.to_json, type: @discriminant }.to_json
            when "remove"
              { type: @discriminant }.to_json
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
            when "set"
              CandidApiClient::Contracts::V2::Types::AuthorizedSignatory.validate_raw(obj: obj)
            when "remove"
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

          # @param member [CandidApiClient::Contracts::V2::Types::AuthorizedSignatory]
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
          def self.set(member:)
            new(member: member, discriminant: "set")
          end

          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatoryUpdate]
          def self.remove
            new(member: nil, discriminant: "remove")
          end
        end
      end
    end
  end
end
