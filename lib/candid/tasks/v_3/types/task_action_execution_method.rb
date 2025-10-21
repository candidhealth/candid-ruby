# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskActionExecutionMethod < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Object }, key: "CLOSE_TASK"
        end
      end
    end
  end
end
