# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for a batch eligibility response.
          class BatchEligibilityResponse < Internal::Types::Model
            field :batch_id, -> { String }, optional: false, nullable: false
            field :submitted_at, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
