# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class BillingNoteBase < Internal::Types::Model
          field :text, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
