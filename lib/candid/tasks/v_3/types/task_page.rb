# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::Tasks::V3::Types::Task] }, optional: false, nullable: false
        end
      end
    end
  end
end
