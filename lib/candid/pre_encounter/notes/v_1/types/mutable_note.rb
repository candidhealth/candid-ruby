# frozen_string_literal: true

module Candid
  module PreEncounter
    module Notes
      module V1
        module Types
          # An object representing a Note.
          class MutableNote < Internal::Types::Model
            field :value, -> { String }, optional: false, nullable: false
            field :author_email, -> { String }, optional: true, nullable: false
            field :author_name, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
