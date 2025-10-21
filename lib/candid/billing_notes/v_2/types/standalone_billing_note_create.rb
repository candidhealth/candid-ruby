
module Candid
  module BillingNotes
    module V2
      module Types
        class StandaloneBillingNoteCreate < Internal::Types::Model
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :text, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
