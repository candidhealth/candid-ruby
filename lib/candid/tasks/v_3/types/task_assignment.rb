# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskAssignment < Internal::Types::Model
          field :task_assignment_id, -> { String }, optional: false, nullable: false
          field :assignee_user_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
