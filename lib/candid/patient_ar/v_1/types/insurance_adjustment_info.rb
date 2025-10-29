# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class InsuranceAdjustmentInfo < Internal::Types::Model
          field :total_adjustment_cents, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
