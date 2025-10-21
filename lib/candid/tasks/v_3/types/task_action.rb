# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskAction < Internal::Types::Model
          field :display_name, -> { String }, optional: false, nullable: false
          field :execution_method, -> { Candid::Tasks::V3::Types::TaskActionExecutionMethod }, optional: false, nullable: false
          field :type, -> { Candid::Tasks::V3::Types::TaskActionType }, optional: false, nullable: false

        end
      end
    end
  end
end
