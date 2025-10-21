# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class PatientHistoryCategory < Internal::Types::Model
          field :category, -> { Candid::Encounters::V4::Types::PatientHistoryCategoryEnum }, optional: false, nullable: false
          field :questions, -> { Internal::Types::Array[Candid::Encounters::V4::Types::IntakeQuestion] }, optional: false, nullable: false

        end
      end
    end
  end
end
