# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskUpdateV3 < Internal::Types::Model
          field :status, -> { Candid::Tasks::Commons::Types::TaskStatus }, optional: true, nullable: false
          field :assignee_user_id, -> { String }, optional: true, nullable: false
          field :blocks_claim_submission, -> { Internal::Types::Boolean }, optional: true, nullable: false

        end
      end
    end
  end
end
