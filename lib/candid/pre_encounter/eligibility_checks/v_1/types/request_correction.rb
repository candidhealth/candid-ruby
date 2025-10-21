# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class RequestCorrection < Internal::Types::Model
            field :property, -> { String }, optional: false, nullable: false
            field :request_value, -> { String }, optional: false, nullable: false
            field :corrected_value, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
