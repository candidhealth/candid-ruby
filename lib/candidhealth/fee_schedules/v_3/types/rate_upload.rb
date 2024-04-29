# frozen_string_literal: true

require "json"
require_relative "new_rate"
require_relative "new_rate_version"

module CandidApiClient
  module FeeSchedules
    module V3
      class RateUpload
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [FeeSchedules::V3::RateUpload]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of RateUpload
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::RateUpload]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "new_rate"
                     FeeSchedules::V3::NewRate.from_json(json_object: json_object)
                   when "new_version"
                     FeeSchedules::V3::NewRateVersion.from_json(json_object: json_object)
                   else
                     FeeSchedules::V3::NewRate.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
        def to_json(*_args)
          case @discriminant
          when "new_rate"
            { **@member.to_json, type: @discriminant }.to_json
          when "new_version"
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
          when "new_rate"
            FeeSchedules::V3::NewRate.validate_raw(obj: obj)
          when "new_version"
            FeeSchedules::V3::NewRateVersion.validate_raw(obj: obj)
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

        # @param member [FeeSchedules::V3::NewRate]
        # @return [FeeSchedules::V3::RateUpload]
        def self.new_rate(member:)
          new(member: member, discriminant: "new_rate")
        end

        # @param member [FeeSchedules::V3::NewRateVersion]
        # @return [FeeSchedules::V3::RateUpload]
        def self.new_version(member:)
          new(member: member, discriminant: "new_version")
        end
      end
    end
  end
end
