# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class Diagnosis < Internal::Types::Model
        field :diagnosis_id, -> { String }, optional: false, nullable: false
        field :created_at, -> { String }, optional: false, nullable: false
        field :updated_at, -> { String }, optional: false, nullable: false

      end
    end
  end
end
