# frozen_string_literal: true

require "json"
require_relative "service_line_allocation_target"
require_relative "claim_allocation_target"
require_relative "billing_provider_allocation_target"

module CandidApiClient
  class Financials
    # Allocation targets describe whether the portion of a payment is being applied toward a specific service line,
    # claim, billing provider, or is unallocated.
    class AllocationTarget
      attr_reader :member, :discriminant

      private_class_method :new
      alias kind_of? is_a?
      # @param member [Object]
      # @param discriminant [String]
      # @return [Financials::AllocationTarget]
      def initialize(member:, discriminant:)
        # @type [Object]
        @member = member
        # @type [String]
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of AllocationTarget
      #
      # @param json_object [JSON]
      # @return [Financials::AllocationTarget]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "service_line"
                   Financials::ServiceLineAllocationTarget.from_json(json_object: json_object)
                 when "claim"
                   Financials::ClaimAllocationTarget.from_json(json_object: json_object)
                 when "billing_provider_id"
                   Financials::BillingProviderAllocationTarget.from_json(json_object: json_object)
                 when "unattributed"
                   nil
                 else
                   Financials::ServiceLineAllocationTarget.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        case @discriminant
        when "service_line"
          { **@member.to_json, type: @discriminant }.to_json
        when "claim"
          { **@member.to_json, type: @discriminant }.to_json
        when "billing_provider_id"
          { **@member.to_json, type: @discriminant }.to_json
        when "unattributed"
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
        when "service_line"
          Financials::ServiceLineAllocationTarget.validate_raw(obj: obj)
        when "claim"
          Financials::ClaimAllocationTarget.validate_raw(obj: obj)
        when "billing_provider_id"
          Financials::BillingProviderAllocationTarget.validate_raw(obj: obj)
        when "unattributed"
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

      # @param member [Financials::ServiceLineAllocationTarget]
      # @return [Financials::AllocationTarget]
      def self.service_line(member:)
        new(member: member, discriminant: "service_line")
      end

      # @param member [Financials::ClaimAllocationTarget]
      # @return [Financials::AllocationTarget]
      def self.claim(member:)
        new(member: member, discriminant: "claim")
      end

      # @param member [Financials::BillingProviderAllocationTarget]
      # @return [Financials::AllocationTarget]
      def self.billing_provider_id(member:)
        new(member: member, discriminant: "billing_provider_id")
      end

      # @return [Financials::AllocationTarget]
      def self.unattributed
        new(member: nil, discriminant: "unattributed")
      end
    end
  end
end
