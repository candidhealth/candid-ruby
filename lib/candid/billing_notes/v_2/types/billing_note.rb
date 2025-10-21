# frozen_string_literal: true

module Candid
  module BillingNotes
    module V2
      module Types
        class BillingNote < Internal::Types::Model
          field :billing_note_id, -> { String }, optional: false, nullable: false
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :author_auth_0_id, -> { String }, optional: true, nullable: false
          field :author_name, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
