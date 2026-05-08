# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class IntakeFollowUpOptional < Internal::Types::Model
          field :id, -> { String }, optional: true, nullable: false
          field :text, -> { String }, optional: true, nullable: false
          field :response, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
