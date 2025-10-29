# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class InterventionOptional < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false
          field :category, -> { Candid::Encounters::V4::Types::InterventionCategory }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :medication, -> { Candid::Encounters::V4::Types::MedicationOptional }, optional: true, nullable: false
          field :labs, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::LabOptional]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
