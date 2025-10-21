# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class DiagnosisNotFoundError < Internal::Types::Model
        field :diagnosis_id, -> { String }, optional: true, nullable: false
        field :message, -> { String }, optional: false, nullable: false

      end
    end
  end
end
