# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class Period < Internal::Types::Model
          field :start, -> { String }, optional: true, nullable: false
          field :end_, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
