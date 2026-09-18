# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        # The result of a pre-service run.
        class PreServiceRun < Internal::Types::Model
          field :run_id, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :entity_external_id, -> { String }, optional: false, nullable: false
          field :edits, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
          field :actions, -> { Internal::Types::Array[Object] }, optional: false, nullable: false
          field :error, -> { Candid::PreServiceRules::V1::Types::PreServiceError }, optional: true, nullable: false
        end
      end
    end
  end
end
