# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class StandaloneDiagnosisCreate < Internal::Types::Model
        field :encounter_id, -> { String }, optional: false, nullable: false

      end
    end
  end
end
