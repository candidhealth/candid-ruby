# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class QueueMovedMetadata < Internal::Types::Model
          field :from_queue_id, -> { String }, optional: false, nullable: false
          field :from_queue_name, -> { String }, optional: false, nullable: false
          field :to_queue_id, -> { String }, optional: false, nullable: false
          field :to_queue_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
