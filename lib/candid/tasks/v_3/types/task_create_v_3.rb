# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskCreateV3 < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :task_type, -> { Candid::Tasks::Commons::Types::TaskType }, optional: false, nullable: false
          field :description, -> { String }, optional: false, nullable: false
          field :blocks_claim_submission, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :assignee_user_id, -> { String }, optional: true, nullable: false
          field :category, -> { Candid::Tasks::Commons::Types::TaskCategory }, optional: true, nullable: false
          field :work_queue_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
