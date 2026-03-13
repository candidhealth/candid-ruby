# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class ValidationError < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::FeeSchedules::V3::Types::OverlappingRateEntriesError }, key: "OVERLAPPING_RATE_ENTRIES"
          member -> { Candid::Commons::Types::EntityConflictErrorMessage }, key: "VERSION_CONFLICT"
          member -> { Candid::Commons::Types::EntityNotFoundErrorMessage }, key: "ORGANIZATION_PROVIDER_NOT_FOUND"
          member -> { Object }, key: "DUPLICATE_RATE"
          member -> { Object }, key: "EMPTY_ENTRIES"
          member -> { Candid::Commons::Types::EntityNotFoundErrorMessage }, key: "PAYER_PLAN_GROUP_NOT_FOUND"
          member -> { Candid::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError }, key: "PAYER_PLAN_GROUP_DOES_NOT_MATCH_RATE_PAYER"
          member -> { Candid::Commons::Types::EntityConflictErrorMessage }, key: "PAYER_PLAN_GROUP_NETWORK_TYPE_MUTUAL_EXCLUSION"
        end
      end
    end
  end
end
