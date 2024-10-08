# frozen_string_literal: true

require "json"
require_relative "service_line_allocation_target"
require_relative "claim_allocation_target"
require_relative "billing_provider_allocation_target"
require_relative "appointment_allocation_target"

module CandidApiClient
  module Financials
    module Types
      # Allocation targets describe whether the portion of a payment is being applied
      #  toward a specific service line,
      #  claim, billing provider, or is unallocated.
      class AllocationTarget
        # @return [Object]
        attr_reader :member
        # @return [String]
        attr_reader :discriminant

        private_class_method :new
        alias kind_of? is_a?

        # @param member [Object]
        # @param discriminant [String]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def initialize(member:, discriminant:)
          @member = member
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of AllocationTarget
        #
        # @param json_object [String]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "service_line"
                     CandidApiClient::Financials::Types::ServiceLineAllocationTarget.from_json(json_object: json_object)
                   when "claim"
                     CandidApiClient::Financials::Types::ClaimAllocationTarget.from_json(json_object: json_object)
                   when "billing_provider_id"
                     CandidApiClient::Financials::Types::BillingProviderAllocationTarget.from_json(json_object: json_object)
                   when "appointment"
                     CandidApiClient::Financials::Types::AppointmentAllocationTarget.from_json(json_object: json_object)
                   when "unattributed"
                     nil
                   else
                     CandidApiClient::Financials::Types::ServiceLineAllocationTarget.from_json(json_object: json_object)
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [String]
        def to_json(*_args)
          case @discriminant
          when "service_line"
            { **@member.to_json, type: @discriminant }.to_json
          when "claim"
            { **@member.to_json, type: @discriminant }.to_json
          when "billing_provider_id"
            { **@member.to_json, type: @discriminant }.to_json
          when "appointment"
            { **@member.to_json, type: @discriminant }.to_json
          when "unattributed"
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
          when "service_line"
            CandidApiClient::Financials::Types::ServiceLineAllocationTarget.validate_raw(obj: obj)
          when "claim"
            CandidApiClient::Financials::Types::ClaimAllocationTarget.validate_raw(obj: obj)
          when "billing_provider_id"
            CandidApiClient::Financials::Types::BillingProviderAllocationTarget.validate_raw(obj: obj)
          when "appointment"
            CandidApiClient::Financials::Types::AppointmentAllocationTarget.validate_raw(obj: obj)
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

        # @param member [CandidApiClient::Financials::Types::ServiceLineAllocationTarget]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.service_line(member:)
          new(member: member, discriminant: "service_line")
        end

        # @param member [CandidApiClient::Financials::Types::ClaimAllocationTarget]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.claim(member:)
          new(member: member, discriminant: "claim")
        end

        # @param member [CandidApiClient::Financials::Types::BillingProviderAllocationTarget]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.billing_provider_id(member:)
          new(member: member, discriminant: "billing_provider_id")
        end

        # @param member [CandidApiClient::Financials::Types::AppointmentAllocationTarget]
        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.appointment(member:)
          new(member: member, discriminant: "appointment")
        end

        # @return [CandidApiClient::Financials::Types::AllocationTarget]
        def self.unattributed
          new(member: nil, discriminant: "unattributed")
        end
      end
    end
  end
end
