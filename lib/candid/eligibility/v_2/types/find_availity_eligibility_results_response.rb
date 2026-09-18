# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      module Types
        class FindAvailityEligibilityResultsResponse < Internal::Types::Model
          field :results, -> { Internal::Types::Array[Candid::Eligibility::V2::Types::AvailityEligibilityResult] }, optional: false, nullable: false
        end
      end
    end
  end
end
