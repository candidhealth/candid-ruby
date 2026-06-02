# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        module BillingNoteType
          extend Candid::Internal::Types::Enum

          MANUAL = "manual"
          SYSTEM = "system"
          QUEUE_ADDED = "queue_added"
          QUEUE_MOVED = "queue_moved"
          TASK_CREATED = "task_created"
        end
      end
    end
  end
end
