# frozen_string_literal: true

require "json"
require_relative "region_states"
require_relative "region_national"

module CandidApiClient
  module Commons
    module Types
      class Regions
        # @return [Object]
        attr_reader :member
        # @return [String]
        attr_reader :discriminant

        private_class_method :new
        alias kind_of? is_a?

        # @param member [Object]
        # @param discriminant [String]
        # @return [CandidApiClient::Commons::Types::Regions]
        def initialize(member:, discriminant:)
          @member = member
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of Regions
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::Regions]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "states"
                     CandidApiClient::Commons::Types::RegionStates.from_json(json_object: json_object)
                   when "national"
                     CandidApiClient::Commons::Types::RegionNational.from_json(json_object: json_object)
                   else
                     CandidApiClient::Commons::Types::RegionStates.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [String]
        def to_json(*_args)
          case @discriminant
          when "states"
            { **@member.to_json, type: @discriminant }.to_json
          when "national"
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
          when "states"
            CandidApiClient::Commons::Types::RegionStates.validate_raw(obj: obj)
          when "national"
            CandidApiClient::Commons::Types::RegionNational.validate_raw(obj: obj)
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

        # @param member [CandidApiClient::Commons::Types::RegionStates]
        # @return [CandidApiClient::Commons::Types::Regions]
        def self.states(member:)
          new(member: member, discriminant: "states")
        end

        # @param member [CandidApiClient::Commons::Types::RegionNational]
        # @return [CandidApiClient::Commons::Types::Regions]
        def self.national(member:)
          new(member: member, discriminant: "national")
        end
      end
    end
  end
end
