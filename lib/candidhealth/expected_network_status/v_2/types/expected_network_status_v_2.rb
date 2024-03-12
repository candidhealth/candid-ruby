# frozen_string_literal: true

require "json"
require_relative "in_network_status"
require_relative "out_of_network_status"
require_relative "indeterminate_network_status"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ExpectedNetworkStatusV2
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of ExpectedNetworkStatusV2
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "in_network"
                     ExpectedNetworkStatus::V2::InNetworkStatus.from_json(json_object: json_object)
                   when "out_of_network"
                     ExpectedNetworkStatus::V2::OutOfNetworkStatus.from_json(json_object: json_object)
                   when "indeterminate"
                     ExpectedNetworkStatus::V2::IndeterminateNetworkStatus.from_json(json_object: json_object)
                   else
                     ExpectedNetworkStatus::V2::InNetworkStatus.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
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

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          case obj.type
          when "in_network"
            ExpectedNetworkStatus::V2::InNetworkStatus.validate_raw(obj: obj)
          when "out_of_network"
            ExpectedNetworkStatus::V2::OutOfNetworkStatus.validate_raw(obj: obj)
          when "indeterminate"
            ExpectedNetworkStatus::V2::IndeterminateNetworkStatus.validate_raw(obj: obj)
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

        # @param member [ExpectedNetworkStatus::V2::InNetworkStatus]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        def self.in_network(member:)
          new(member: member, discriminant: "in_network")
        end

        # @param member [ExpectedNetworkStatus::V2::OutOfNetworkStatus]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        def self.out_of_network(member:)
          new(member: member, discriminant: "out_of_network")
        end

        # @param member [ExpectedNetworkStatus::V2::IndeterminateNetworkStatus]
        # @return [ExpectedNetworkStatus::V2::ExpectedNetworkStatusV2]
        def self.indeterminate(member:)
          new(member: member, discriminant: "indeterminate")
        end
      end
    end
  end
end
