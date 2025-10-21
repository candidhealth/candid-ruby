# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class BillingNoteBaseOptional < Internal::Types::Model
          field :text, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
