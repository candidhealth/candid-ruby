# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        class PreServiceEncounterRunCreate < Internal::Types::Model
          field :entity, -> { Candid::PreServiceRules::V1::Types::PreServiceEncounterCreate }, optional: false, nullable: false
          field :pipeline_id, -> { String }, optional: false, nullable: false
          field :enabled_rule_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :disabled_rule_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
