# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        class GetPreServiceRunRequest < Internal::Types::Model
          field :run_id, -> { String }, optional: false, nullable: false
          field :include_initial_entity_state, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
