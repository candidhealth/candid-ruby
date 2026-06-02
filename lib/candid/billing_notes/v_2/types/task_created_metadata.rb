# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class TaskCreatedMetadata < Internal::Types::Model
          field :task_id, -> { String }, optional: false, nullable: false
          field :task_type, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
