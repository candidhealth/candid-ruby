# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class QueueAddedMetadata < Internal::Types::Model
          field :queue_id, -> { String }, optional: false, nullable: false
          field :queue_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
