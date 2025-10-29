# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class IntakeQuestion < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :text, -> { String }, optional: false, nullable: false
          field :responses, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::IntakeResponseAndFollowUps]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
