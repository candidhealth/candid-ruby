# frozen_string_literal: true

require "json"
require_relative "in_network_status"
require_relative "out_of_network_status"
require_relative "indeterminate_network_status"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusV2
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of ExpectedNetworkStatusV2
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            case struct.type
            when "in_network"
              member = CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus.from_json(json_object: json_object)
            when "out_of_network"
              member = CandidApiClient::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus.from_json(json_object: json_object)
            when "indeterminate"
              member = CandidApiClient::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus.from_json(json_object: json_object)
            else
              member = CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus.from_json(json_object: json_object)
            end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "in_network"
              { **@member.to_json, type: @discriminant }.to_json
            when "out_of_network"
              { **@member.to_json, type: @discriminant }.to_json
            when "indeterminate"
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
            when "in_network"
              CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus.validate_raw(obj: obj)
            when "out_of_network"
              CandidApiClient::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus.validate_raw(obj: obj)
            when "indeterminate"
              CandidApiClient::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus.validate_raw(obj: obj)
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

          # @param member [CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          def self.in_network(member:)
            new(member: member, discriminant: "in_network")
          end

          # @param member [CandidApiClient::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          def self.out_of_network(member:)
            new(member: member, discriminant: "out_of_network")
          end

          # @param member [CandidApiClient::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2]
          def self.indeterminate(member:)
            new(member: member, discriminant: "indeterminate")
          end
        end
      end
    end
  end
end
