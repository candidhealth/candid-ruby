# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class PatientHistoryCategoryOptional < Internal::Types::Model
          field :category, -> { Candid::Encounters::V4::Types::PatientHistoryCategoryEnum }, optional: true, nullable: false
          field :questions, -> { Internal::Types::Array[Candid::Encounters::V4::Types::IntakeQuestionOptional] }, optional: true, nullable: false

        end
      end
    end
  end
end
