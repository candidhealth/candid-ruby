# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageGetMultiRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
