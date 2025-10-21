# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskUpdatedToDeprecatedStatusErrorType < Internal::Types::Model
          field :deprecated_status, -> { Candid::Tasks::Commons::Types::TaskStatus }, optional: true, nullable: false

        end
      end
    end
  end
end
