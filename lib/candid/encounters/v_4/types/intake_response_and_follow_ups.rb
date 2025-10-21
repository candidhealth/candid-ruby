# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class IntakeResponseAndFollowUps < Internal::Types::Model
          field :response, -> { String }, optional: true, nullable: false
          field :follow_ups, -> { Internal::Types::Array[Candid::Encounters::V4::Types::IntakeFollowUp] }, optional: true, nullable: false

        end
      end
    end
  end
end
