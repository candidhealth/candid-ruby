# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class DisallowMultiplePrimaryDiagnosisError < Internal::Types::Model
        field :existing_primary_diagnosis_id, -> { String }, optional: false, nullable: false
        field :new_primary_diagnosis_id, -> { String }, optional: false, nullable: false
        field :message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
