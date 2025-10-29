# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        module TaskActionType
          extend Candid::Internal::Types::Enum

          CLOSE_TASK = "close_task"
          CLOSE_TASK_AND_REPROCESS = "close_task_and_reprocess"
        end
      end
    end
  end
end
