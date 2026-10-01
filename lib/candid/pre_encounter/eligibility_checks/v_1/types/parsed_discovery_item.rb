# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class ParsedDiscoveryItem < Internal::Types::Model
            field :confidence, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::Confidence }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
