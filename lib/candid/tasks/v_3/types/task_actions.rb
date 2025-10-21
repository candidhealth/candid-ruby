# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskActions < Internal::Types::Model
          field :actions, -> { Internal::Types::Array[Candid::Tasks::V3::Types::TaskAction] }, optional: false, nullable: false

        end
      end
    end
  end
end
