
module Candid
  module BillingNotes
    module V2
      module Types
        class BillingNoteUpdate < Internal::Types::Model
          field :billing_note_id, -> { String }, optional: false, nullable: false
          field :text, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
