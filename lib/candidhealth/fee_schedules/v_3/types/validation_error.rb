# frozen_string_literal: true

require "json"
require_relative "overlapping_rate_entries_error"
require_relative "../../../commons/types/entity_conflict_error_message"
require_relative "../../../commons/types/entity_not_found_error_message"
require_relative "payer_plan_group_does_not_match_rate_payer_error"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class ValidationError
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of ValidationError
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            case struct.type
            when "overlapping_rate_entries"
              member = CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError.from_json(json_object: json_object)
            when "version_conflict"
              member = CandidApiClient::Commons::Types::EntityConflictErrorMessage.from_json(json_object: json_object)
            when "organization_provider_not_found"
              member = CandidApiClient::Commons::Types::EntityNotFoundErrorMessage.from_json(json_object: json_object)
            when "duplicate_rate"
              member = nil
            when "empty_entries"
              member = nil
            when "payer_plan_group_not_found"
              member = CandidApiClient::Commons::Types::EntityNotFoundErrorMessage.from_json(json_object: json_object)
            when "payer_plan_group_does_not_match_rate_payer"
              member = CandidApiClient::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError.from_json(json_object: json_object)
            else
              member = CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError.from_json(json_object: json_object)
            end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "overlapping_rate_entries"
              { **@member.to_json, type: @discriminant }.to_json
            when "version_conflict"
              { **@member.to_json, type: @discriminant }.to_json
            when "organization_provider_not_found"
              { **@member.to_json, type: @discriminant }.to_json
            when "duplicate_rate"
              { type: @discriminant }.to_json
            when "empty_entries"
              { type: @discriminant }.to_json
            when "payer_plan_group_not_found"
              { **@member.to_json, type: @discriminant }.to_json
            when "payer_plan_group_does_not_match_rate_payer"
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
            when "overlapping_rate_entries"
              CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError.validate_raw(obj: obj)
            when "version_conflict"
              CandidApiClient::Commons::Types::EntityConflictErrorMessage.validate_raw(obj: obj)
            when "organization_provider_not_found"
              CandidApiClient::Commons::Types::EntityNotFoundErrorMessage.validate_raw(obj: obj)
            when "duplicate_rate"
              # noop
            when "empty_entries"
              # noop
            when "payer_plan_group_not_found"
              CandidApiClient::Commons::Types::EntityNotFoundErrorMessage.validate_raw(obj: obj)
            when "payer_plan_group_does_not_match_rate_payer"
              CandidApiClient::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError.validate_raw(obj: obj)
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

          # @param member [CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.overlapping_rate_entries(member:)
            new(member: member, discriminant: "overlapping_rate_entries")
          end

          # @param member [CandidApiClient::Commons::Types::EntityConflictErrorMessage]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.version_conflict(member:)
            new(member: member, discriminant: "version_conflict")
          end

          # @param member [CandidApiClient::Commons::Types::EntityNotFoundErrorMessage]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.organization_provider_not_found(member:)
            new(member: member, discriminant: "organization_provider_not_found")
          end

          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.duplicate_rate
            new(member: nil, discriminant: "duplicate_rate")
          end

          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.empty_entries
            new(member: nil, discriminant: "empty_entries")
          end

          # @param member [CandidApiClient::Commons::Types::EntityNotFoundErrorMessage]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.payer_plan_group_not_found(member:)
            new(member: member, discriminant: "payer_plan_group_not_found")
          end

          # @param member [CandidApiClient::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ValidationError]
          def self.payer_plan_group_does_not_match_rate_payer(member:)
            new(member: member, discriminant: "payer_plan_group_does_not_match_rate_payer")
          end
        end
      end
    end
  end
end
