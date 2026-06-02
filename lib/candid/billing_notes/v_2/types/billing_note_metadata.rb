# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class BillingNoteMetadata < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::BillingNotes::V2::Types::QueueAddedMetadata }, key: "QUEUE_ADDED"
          member -> { Candid::BillingNotes::V2::Types::QueueMovedMetadata }, key: "QUEUE_MOVED"
          member -> { Candid::BillingNotes::V2::Types::TaskCreatedMetadata }, key: "TASK_CREATED"
        end
      end
    end
  end
end
